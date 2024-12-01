import pickle

from flask import Flask, jsonify, request

penguin_species = ['Adelie', 'Chinstrap', 'Gentoo']

def predict_single(penguin, dv, model):
    penguin_std = dv.transform([penguin])
    y_pred = model.predict(penguin_std)[0]
    y_prob = model.predict_proba(penguin_std)[0][y_pred]
    return (y_pred, y_prob)

def predict(dv, model):
    penguin = request.get_json()
    specie, probability = predict_single(penguin, dv, model)

    result = {
        'penguin': penguin_species[specie],
        'probability': float(probability)
    }
    return jsonify(result)

app = Flask('penguins')


@app.route('/predict_lr', methods=['POST'])
def predict_lr():
    with open('models/lr.pck', 'rb') as f:
        dv, model = pickle.load(f)
    return predict(dv,model)

@app.route('/predict_svm', methods=['POST'])
def predict_svm():
    with open('models/svm.pck', 'rb') as f:
        dv, model = pickle.load(f)
    return predict(dv,model)

@app.route('/predict_dt', methods=['POST'])
def predict_dt():
    with open('models/dt.pck', 'rb') as f:
        dv, model = pickle.load(f)
    return predict(dv,model)

@app.route('/predict_knn', methods=['POST'])
def predict_knn():
    with open('models/knn.pck', 'rb') as f:
        dv, model = pickle.load(f)
    return predict(dv,model)


if __name__ == '__main__':
    app.run(debug=True, port=8000)