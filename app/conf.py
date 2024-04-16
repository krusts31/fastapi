import yaml
import os

env = os.getenv('ENV')

if env == 'PROD':
    conf_path = 'conf-prod.yaml'
elif env == 'TEST':
    conf_path = 'conf-test.yaml'
else:
    conf_path = 'conf-dev.yaml'

conf_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), conf_path)
conf = None
with open(conf_path) as f:
    conf = yaml.safe_load(f)
