from flask import Flask, Response
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

# Create a Counter metric
REQUEST_COUNT = Counter('request_count', 'Total number of requests')

@app.route('/')
def hello():
    REQUEST_COUNT.inc()  # Increment on every request
    return "Hello from Flask on Kubernetes!"

# Expose metrics for Prometheus
@app.route('/metrics')
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == '__main__':
    # Start Flask app on port 5000
    app.run(host='0.0.0.0', port=5000)
