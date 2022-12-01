#!/bin/bash

createing()
{
figlet Creating
echo "HAPPY HACKING"
echo "createing namespace sai "
kubectl create ns sai
echo "passing secret file"
echo " "
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
echo " "
echo "deploying pod service and hpa"
kubectl apply -n sai -f svc.yaml
kubectl apply -n sai -f deployment.yaml
kubectl apply -n sai -f hpa.yaml --validate=false
echo "finally press ctrl+c"
echo "working fine"
echo "HAPPY HACKING"
}


destroy()
{
figlet Deleting
echo "Have a Good Day:)"
echo "delete pod service and hpa"
echo "delete ns and all"
kubectl delete ns sai
echo "Deleting sonarqube"
}

scan()
{
figlet Scaning
./scan.sh
}

Checking(){
read -p "application deatils : " enter
$enter   
}

end(){
exit
}

while :
do
figlet SAG Task
echo " "
echo "Creating Infrasture : 1 "
echo " "
echo "Deleting Infrasture : 2 "
echo " "
echo "Security scan : 3 "
echo " "
echo "Checking details about application status : 4 "
echo " "
echo "exit() : 6 "
echo " "
read -p "value : " my
echo " "
  if [[ $my -eq 1 ]]
  then
    createing
    echo "running"
  elif (($my==2))
  then
  echo "enter the password : "
  read password

  elif (($my==3))
  then
    scan
    echo "Open Ports form the given ip "
  elif (($my==4))
  then
    Checking
    echo "not "
  elif (($my==5))
  then
done
