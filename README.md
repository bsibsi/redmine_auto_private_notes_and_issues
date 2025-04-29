# Redmine Auto Private Notes

A simple Redmine plugin that automatically checks the `Private notes` checkbox when editing an issue, based on the user's role in the project.

## Features

- Automatically pre-checks the `Private notes` checkbox if the current user has a configured role in the current project.
- Easy configuration through the plugin settings UI.
- Lightweight, zero database migrations or patches.
- Redmine 6 compatible.

## Installation

1. Clone or copy this plugin into Redmine’s `plugins/` directory:

    ```bash
    cd redmine/plugins
    git clone https://github.com/bsibsi/redmine_auto_private_notes.git
    ```

2. Restart Redmine.

3.	Go to **Administration → Plugins → Redmine Auto Private Notes → Configure** and select the roles for which the checkbox should be pre-checked.

## Compatibility

Tested with Redmine 6.0.

## License

BSD-2 – see LICENSE.txt
