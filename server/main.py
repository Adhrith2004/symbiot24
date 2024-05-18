import numpy as np
from flask import Flask, request, jsonify, render_template
import pickle

app = Flask(__name__)
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/predict',methods=['POST'])
def predict():
    # Get the data from the POST request
    data = request.get_json(force=True)
    # Make prediction using model loaded from disk as per the data
    prediction = model.predict([[np.array(data['exp'])]])
    # Take the first value of prediction
    return prediction


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)