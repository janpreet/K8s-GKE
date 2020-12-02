username = {}
password = {}
cluster_name = "k8s-playground"
machine_type = "n1-standard-1"
initial_node_count = 1
oauth_scopes = [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/trace.append"     
    ]
min_node_count = 3
max_node_count = 100   