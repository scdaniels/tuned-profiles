# tuned-profiles
Various tuned profiles

## Using these profiles:
Set whatever profile you want to install as $PROFILE and run as root:
```
# select profile, export it:
export PROFILE=db2

# install tuned if needed:
yum list --installed tuned >/dev/null 2>&1 || yum -y install tuned

# clone repo and copy in profile:
git clone https://github.com/pchauncey/tuned-profiles.git
cp tuned-profiles/${PROFILE} /usr/lib/tuned/

# enable and start tuned and enable the profile:
systemctl enable --now tuned 
tuned-adm profile ${PROFILE} 
```
