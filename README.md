# tuned-profiles
Various tuned profiles

## RHEL7 Installation
Set whatever profile you want to install as $PROFILE and run as root:
```
export PROFILE=db2
yum -y install tuned
cd /tmp
git clone https://github.com/pchauncey/tuned-profiles.git
cp tuned-profiles/${PROFILE} /usr/lib/tuned/
systemctl enable --now tuned
tuned-adm profile ${PROFILE}
```
