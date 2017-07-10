# tuned-profiles
Various tuned profiles

## Installation
Set whatever profile you want to install as $PROFILE and off you go:
```
export PROFILE=db2
cd /tmp
git clone https://github.com/pchauncey/tuned-profiles.git
sudo cp tuned-profiles/${PROFILE} /usr/lib/tuned/
sudo chkconfig tuned on
sudo tuned-adm profile ${PROFILE}
```
