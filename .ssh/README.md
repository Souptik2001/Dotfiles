## My preferred SSH keys structuring

**My `.ssh` folder structure -**

~/.ssh
├── config
├── keys
│   ├── server1_key
│   |   ├── server1_key
│   |   └── server1_key.pub
|   └── server2_key
│       ├── server1_key
│       └── server1_key.pub
└── known_hosts

**Creating a new SSH key -**

```bash
mkdir -p ~/.ssh/keys/<use_case>
ssh-keygen -f ~/.ssh/keys/<use_case>/<use_case> -t ed25519 -C "Key's use-case here."
```
