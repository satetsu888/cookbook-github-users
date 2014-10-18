github-users Cookbook
=====================
This cookbook makes easy to create users, who using ssh-public-keys on github.
And this cookbook also download and setup users "dotfiles" repo from github.

Requirements
------------
git

openssl

Attributes
----------

#### github-users::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['github-users']['accounts']</tt></td>
    <td>Array</td>
    <td>github account names</td>
    <td> - </td>
  </tr>
</table>

Usage
-----

#### github-users::default

Just include `github-users` in your node's `run_list`:
and Add your account name of github.

```json
{
  "name":"my_node",
  "github-users": {
    "accounts":["satetsu888"] // thanks for allowing me to login your servers :p
  },
  "run_list": [
    "recipe[github-users]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github (https://github.com/satetsu888/cookbook-github-users)
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Authors: satetsu888
