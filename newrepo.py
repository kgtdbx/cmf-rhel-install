import time
import datetime
from cm_api.api_client import ApiResource

cm_host = "node0"
api = ApiResource(cm_host, username="admin", password="admin")


# replace parcel_repo with the parcel repo you want to use

parcel_repo = 'http://repository.cask.co/parcels/cdap/3.6/'

cm_config = api.get_cloudera_manager().get_config(view='full')
repo_config = cm_config['REMOTE_PARCEL_REPO_URLS']
print repo_config
value = repo_config.value or repo_config.default
# value is a comma-separated list
value += ',' + parcel_repo
print value
api.get_cloudera_manager().update_config({'REMOTE_PARCEL_REPO_URLS': value})
# wait to make sure parcels are refreshed
time.sleep(10)

cluster_name = 'Cluster 1'
cluster = api.get_cluster(cluster_name)

parcel_version = '3.6.0-1'
parcel = cluster.get_parcel('CDAP', parcel_version)
parcel.start_download()

while True:
  parcel = cluster.get_parcel('CDAP', parcel_version)
  if parcel.stage == 'DOWNLOADED':
    break
  if parcel.state.errors:
    raise Exception(str(parcel.state.errors))
  print "progress: %s / %s" % (parcel.state.progress, parcel.state.totalProgress)
  time.sleep(15) # check again in 15 seconds

print "downloaded CDAP  parcel version %s on cluster %s" % (parcel_version, cluster_name)


parcel.start_distribution()
while True:
  parcel = cluster.get_parcel('CDAP', parcel_version)
  if parcel.stage == 'DISTRIBUTED':
    break
  if parcel.state.errors:
    raise Exception(str(parcel.state.errors))
  print "progress: %s / %s" % (parcel.state.progress, parcel.state.totalProgress)
  time.sleep(15) # check again in 15 seconds

print "distributed CDAP parcel version %s on cluster %s" % (parcel_version, cluster_name)

parcel.activate()
while True: 
   parcel = cluster.get_parcel('CDAP', parcel_version)
   if parcel.stage == 'ACTIVATED':
     break 
   if parcel.state.errors: 
	raise Excption(str(parcel.state.errors))
   print "progress: %s / %s" % (parcel.state.progress, parcel.state.totalProgress)
   time.sleep(5) 
print "activeted CDAP parcel version %s on cluster %s" % (parcel_version,cluster_name)
