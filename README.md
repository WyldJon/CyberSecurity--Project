## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
	- By adding redundancy to a network, load balancers protect against DDoS attacks by helping to eliminate single points of failure.
	- Including a Jump Box in the network further adds to the security as it prevents public access to resources by only allowing users with access to the Jump Box to access the internal network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.
	- Filebeat is the beat that monitors and logs changes with the files in a system.
	- Metricbeat is the beat used to monitor and log changes in metric such as CPU or uptime.


The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function              | IP Address | Operating System     |
|----------------------|-----------------------|------------|----------------------|
| Jump-Box-Provisioner | Gateway               | 10.0.0.4   | Linux (ubuntu 18.04) |
| Web-1                | DVWA Docker Container | 10.0.0.5   | Linux (ubuntu 18.04) |
| Web-2                | DVWA Docker Container | 10.0.0.6   | Linux (ubuntu 18.04) |
| ELK-1                | ELK Stack Server      | 10.1.0.4   | Linux (ubuntu 18.04) |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
	- 24.22.90.198

Machines within the network can only be accessed by Jump-Box-Provisioner.
	- The Jump-Box-Provisioner (10.0.0.4) is the only machine allow to access the ELK VM (10.1.0.4).


A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible         | Allowed IP Addresses  |
|----------------------|-----------------------------|-----------------------|
| Jump-Box-Provisioner | Yes                         | 24.22.90.198          |
| Web-1                | Yes (through load balancer) | 24.22.90.198 10.0.0.4 |
| Web-1                | Yes (through load balancer) | 24.22.90.198 10.0.0.4 |
| ELK-1                | Yes                         | 24.22.90.198 10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
	- Using Ansible to deploy infastructure is advantageous as it allows for easy redeployment if needed. It also allows for standard configuration to be deployed on multiple machines, reducing time needed. Reconfiguring machines is much easier as only the playbook needs to be updated.


The playbook implements the following tasks:
	- Install docker.io
	- Install pip3 and python docker module
	- Increase virtual memory so that the ELK stack can run properly
	- Download ELK-stack image file and start ELK docker container
	- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
	- Web-1 10.0.0.5
	- Web-2 10.0.0.6

We have installed the following Beats on these machines:
	- Filebeat
	- Metricbeat

These Beats allow us to collect the following information from each machine:
	- Filebeat: Collects information regarding the file system. Filebeat will send information regarding file modifications to Elasticsearch.
	- Metricbeat: Collect information on the metrics of the system. This includes metrics such as CPU usage, making sure CPU usage does not become too high and uptime, making sure that servers are up when they are suppose to be. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elkstack.yml file to /etc/ansible.
- Update the /etc/ansible/hosts file to include an elk group and include the following line 10.1.0.4 ansible_python_interpreter=/usr/bin/python3 to specify which VMs the playbook will configure.
- Run the playbook, and navigate to http://[elk server ip]:5601/app/kibana to check that the installation worked as expected.
