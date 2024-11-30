import numpy as np

def predict_single(customer, dv, model):
    x = dv.transform([customer])
    y_pred_prob = model.predict_proba(x)

    predicted_type = np.argmax(y_pred_prob, axis=1)[0]
    return (predicted_type, y_pred_prob[0])  