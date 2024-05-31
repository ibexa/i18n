# Ibexa i18n

[![Crowdin](https://badges.crowdin.net/ibexa-dxp/localized.svg)](https://crowdin.com/project/ibexa-dxp)

## Introduction

This is a meta repository that centralizes Ibexa translations to ease synchronization with Crowdin.

This repository is supposed to be used on a production project. There is an integration configured between Crowdin and Github.
When the translator provides a new translation message in the Crowdin UI then it will be automatically transferred to the l10n_main branch of ibexa/i18 package.
As the last step of synchronization, a new PR will be created with new translations or, if a PR is already open, it will be updated with a new commit. Then the PR should be merged to the main branch with squashed commits and tagged if needed.

All translations will be available as a part of the product. To enable them, use the following configuration:

``` yaml
ibexa:
    ui:
        translations:
            enabled: true
```
## Crowdin

If you want to help us translate Ibexa Open Source, feel free to contribute on the [Ibexa project on Crowdin][crowdin-ibexa-dxp].

## COPYRIGHT

Copyright (C) 1999-2024 Ibexa AS (formerly eZ Systems AS). All rights reserved.

## LICENSE

This source code is available separately under the following licenses:

A - Ibexa Business Use License Agreement (Ibexa BUL),
version 2.3 or later versions (as license terms may be updated from time to time)
Ibexa BUL is granted by having a valid Ibexa DXP (formerly eZ Platform Enterprise) subscription,
as described at: https://www.ibexa.co/product
For the full Ibexa BUL license text, please see:
- LICENSE-bul file placed in the root of this source code, or
- https://www.ibexa.co/software-information/licenses-and-agreements (latest version applies)

AND

B - GNU General Public License, version 2
Grants an copyleft open source license with ABSOLUTELY NO WARRANTY. For the full GPL license text, please see:
- LICENSE file placed in the root of this source code, or
- https://www.gnu.org/licenses/old-licenses/gpl-2.0.html

[crowdin-ibexa-dxp]: https://crowdin.com/project/ibexa-dxp
[ibexa-i18n]: https://github.com/ibexa/i18n

