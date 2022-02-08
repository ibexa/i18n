# Ibexa i18n

[![Crowdin](https://d322cqt584bo4o.cloudfront.net/ezplatform/localized.svg)](https://crowdin.com/project/ezplatform)

## Introduction

This is a meta repository that centralizes Ibexa translations to ease synchronization with Crowdin.

**Important** : This repository is not supposed to be used on a production project, each translation will be
split into a dedicated package.

## Crowdin

If you want to help us translate Ibexa Open Source, feel free to contribute on the [Ibexa project on Crowdin][crowdin-ezplatform].

### In context translation

You can enable [Crowdin in context translation][in-context] by setting a specific cookie on an Ibexa application.

One way to do this is to open the development console (right click, inspect) and run these lines:

**Enable :**

    document.cookie='ez_in_context_translation=1;path=/;'; location.reload();

**Disable :**

    document.cookie='ez_in_context_translation=;expires=Mon, 05 Jul 2000 00:00:00 GMT;path=/;'; location.reload();

## COPYRIGHT

Copyright (C) 1999-2021 Ibexa AS (formerly eZ Systems AS). All rights reserved.

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

[dflydev]: https://github.com/dflydev/git-subsplit
[crowdin-ezplatform]: https://crowdin.com/project/ezplatform
[ibexa-i18n-org]: https://github.com/ibexa/i18n
[in-context]: https://crowdin.com/page/in-context-localization
