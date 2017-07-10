# tuned-profiles
Various tuned profiles

## RHEL7 Installation
Set whatever profile you want to install as $PROFILE and run as root:
```
yum -y install tuned
export PROFILE=db2
cd /tmp
git clone https://github.com/pchauncey/tuned-profiles.git
cp tuned-profiles/${PROFILE} /usr/lib/tuned/
systemctl enable tuned
tuned-adm profile ${PROFILE}
```
