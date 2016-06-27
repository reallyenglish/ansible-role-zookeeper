ansible-role-zookeeper
======================

Install zookeeper

Requirements
------------

None

Role Variables
--------------

| variable | description | default |
|----------|-------------|---------|
| zookeeper\_user      | user name of the service | zookeeper |
| zookeeper\_group     | group name of the service | zookeeper |
| zookeeper\_log\_dir  | path to log directory | /var/log/zookeeper |
| zookeeper\_db\_dir   | path to database dir | "{{ \_\_zookeeper\_db\_dir }}" |
| zookeeper\_service   | service name | zookeeper |
| zookeeper\_conf      | path to zoo.cfg | "{{ \_\_zookeeper\_conf }}" |
| zookeeper\_conf\_dir | path to config directory | "{{ \_\_zookeeper\_conf\_dir }}" |
| zookeeper\_flags     | (not used yet ) | "" |
| zookeeper\_config     | content of zoo.cfg | "" |
| zookeeper\_myid      | myid of the zookeeper | false |


Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
        - ansible-role-zookeeper
      vars:
        zookeeper_myid: 1
        zookeeper_config: |
          tickTime=3000
          initLimit=10
          syncLimit=5
          dataDir=/var/db/zookeeper
          clientPort=2181

License
-------

BSD

Author Information
------------------

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
