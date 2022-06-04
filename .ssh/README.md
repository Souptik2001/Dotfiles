## My preferred SSH keys structuring

**My `.ssh` folder structure -**

~/.ssh
├── config
├── keys
│   ├── git_key
│   │   ├── id_rsa
│   │   └── id_rsa.pub
│   ├── server1_key
│   |   ├── id_ed25519
│   |   └── id_ed25519.pub
|   └── server2_key
│       ├── id_ed25519
│       └── id_ed25519.pub
├── known_hosts
└── known_hosts.old

**Creating a new SSH key -**

```bash
mkdir -p ~/.ssh/keys/<use_case>
ssh-keygen -f ~/.ssh/keys/<use_case>/<use_case> -t ed25519 -C "Key's use-case here."
```
