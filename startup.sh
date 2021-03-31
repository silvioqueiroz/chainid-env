#!/bin/bash
#sudo apt-get install git
#git --version
#git clone https://github.com/bcgov/von-network.git
#git clone https://github.com/hyperledger/aries-cloudagent-python.git


# start network
cd /home/$USER/chainid-env/von-network
sudo ./manage stop
sudo ./manage build
sudo ./manage up &


# aca-py instancieis
cd /home/$USER/chainid-env/aries-cloudagent-python
PORTS="8051 8050" sudo ./scripts/run_docker  start --wallet-type indy --wallet-key 5yxH9BeNvh3ijmSJ47sAPpNmPAR4xqKEdVXY3GF5frtv --wallet-name rnp.cloudagent  --genesis-url http://34.121.253.98:9000/genesis -it http 0.0.0.0 8050 -ot http --admin 0.0.0.0 8051 --admin-insecure-mode --webhook-url http://d04884392450.ngrok.io/webhook --trace-target log --trace-tag acapy.events --trace-label issuer.Agent.trace --auto-accept-invites --auto-accept-requests --auto-ping-connection --auto-store-credential --events  --auto-respo --bg
#PORTS="8061 8060" sudo ./scripts/run_docker  start --wallet-type indy --wallet-key 5yxH9BeNvh3ijmSJ47sAPpNmPAR4xqKEdVXY3GF5frtv --wallet-name ufba.cloudagent --genesis-url http://34.121.253.98:9000/genesis -it http 0.0.0.0 8050 -ot http --admin 0.0.0.0 8051 --admin-insecure-mode --webhook-url http://d04884392450.ngrok.io/webhook --trace-target log --trace-tag acapy.events --trace-label issuer.Agent.trace --auto-accept-invites --auto-accept-requests --auto-ping-connection --auto-store-credential --events  --auto-respo --bg
#PORTS="8071 8070" sudo ./scripts/run_docker  start --wallet-type indy --wallet-key 5yxH9BeNvh3ijmSJ47sAPpNmPAR4xqKEdVXY3GF5frtv --wallet-name uefs.cloudagent --genesis-url http://34.121.253.98:9000/genesis -it http 0.0.0.0 8050 -ot http --admin 0.0.0.0 8051 --admin-insecure-mode --webhook-url http://d04884392450.ngrok.io/webhook --trace-target log --trace-tag acapy.events --trace-label issuer.Agent.trace --auto-accept-invites --auto-accept-requests --auto-ping-connection --auto-store-credential --events  --auto-respo --bg


