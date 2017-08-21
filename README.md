# ansible-role-zookeeper

Install zookeeper

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `zookeeper_user` | user name of the service | `zookeeper` |
| `zookeeper_group` | group name of the service | `zookeeper` |
| `zookeeper_log_dir` | path to log directory | `/var/log/zookeeper` |
| `zookeeper_db_dir` | path to database directory | `{{ __zookeeper_db_dir }}` |
| `zookeeper_service` | name of the service | `zookeeper` |
| `zookeeper_conf` | path to `zoo.cfg` | `{{ zookeeper_conf_dir }}/zoo.cfg` |
| `zookeeper_conf_dir` | path to configuration directory | `{{ __zookeeper_conf_dir }}` |
| `zookeeper_flags` | (not implemented yet) | `""` |
| `zookeeper_myid` | `myid` of the zookeeper | `false` |
| `zookeeper_config` | content of `zoo.cfg` | `""` |

## FreeBSD

| Variable | Default |
|----------|---------|
| `__zookeeper_db_dir` | `/var/db/zookeeper` |
| `__zookeeper_conf_dir` | `/usr/local/etc/zookeeper` |

# Dependencies

- `reallyenglish.java`

# Example Playbook

```yaml
- hosts: all
  roles:
    - ansible-role-zookeeper
  vars:
    java_packages:
      # XXX this must match the one zookeeper depends on
      - java/openjdk7
    zookeeper_myid: 1
    zookeeper_config: |
      tickTime=3000
      initLimit=10
      syncLimit=5
      dataDir=/var/db/zookeeper
      clientPort=2181
```

# License

```
Copyright (c) 2017 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
