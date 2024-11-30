import pickle

from flask import Flask, jsonify, request

type_names = ['Iris Setosa', 'Iris Versicolour', 'Iris Virginica']

def predict_single(flower, sc, model):
    flower_std = sc.transform([[flower['petal_length'],flower['petal_width']]])
    y_pred = model.predict(flower_std)[0]
    y_prob = model.predict_proba(flower_std)[0][y_pred]
    return (y_pred, y_prob)

def predict(sc, model):
    flower = request.get_json()
    type, probability = predict_single(flower, sc, model)
   
    result = {
        'flower': type_names[type],
        'probability': float(probability)
    }
    return jsonify(result)

app = Flask('iris')


@app.route('/predict_lr', methods=['POST'])
def predict_lr():
    with open('models/lr.pck', 'rb') as f:
        sc, model = pickle.load(f)
    return predict(sc,model)

@app.route('/predict_svm', methods=['POST'])
def predict_svm():
    with open('models/svm.pck', 'rb') as f:
        sc, model = pickle.load(f)
    return predict(sc,model)

@app.route('/predict_dt', methods=['POST'])
def predict_dt():
    with open('models/dt.pck', 'rb') as f:
        sc, model = pickle.load(f)
    return predict(sc,model)

@app.route('/predict_knn', methods=['POST'])
def predict_knn():
    with open('models/knn.pck', 'rb') as f:
        sc, model = pickle.load(f)
    return predict(sc,model)


if __name__ == '__main__':
    app.run(debug=True, port=8000)