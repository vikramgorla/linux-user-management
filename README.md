linux-user-management Cookbook
==========================
This cookbook uses Chef standard "users" cookbook and create users under different groups
- support
- operations
- tools
- troubleshooters

Requirements
------------
#### cookbooks
- `users`
- `sudo`

Attributes
----------
#### nestle-dolcegusto::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['support-databag']['bacon']</tt></td>
    <td>text</td>
    <td>Databag Name where support users will be defined</td>
    <td><tt>support</tt></td>
  </tr>
</table>

Usage
-----
Just include `linux-user-management` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[linux-user-management]"
  ]
}
```


License and Authors
-------------------
Authors: 
- Vikram Venkataravana Reddy <vikram@vikram-gorla.com>
