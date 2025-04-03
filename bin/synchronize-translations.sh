#!/usr/bin/env bash
# Synchronize translation sources from all packages to i18n
echo '# Translation synchronization';

echo '# Mirror the translation files';

declare -A packages
packages[share]=vendor/ibexa/share/src/bundle/Resources/translations
packages[connector-openai]=vendor/ibexa/connector-openai/src/bundle/Resources/translations
packages[connector-seenthis]=vendor/ibexa/connector-seenthis/src/bundle/Resources/translations
packages[order-management]=vendor/ibexa/order-management/src/bundle/Resources/translations
packages[system-info]=vendor/ibexa/system-info/src/bundle/Resources/translations
packages[payment]=vendor/ibexa/payment/src/bundle/Resources/translations
packages[content-forms]=vendor/ibexa/content-forms/src/bundle/Resources/translations
packages[checkout]=vendor/ibexa/checkout/src/bundle/Resources/translations
packages[content-tree]=vendor/ibexa/content-tree/src/bundle/Resources/translations
packages[workflow]=vendor/ibexa/workflow/src/bundle/Resources/translations
packages[connector-qualifio]=vendor/ibexa/connector-qualifio/src/bundle/Resources/translations
packages[measurement]=vendor/ibexa/measurement/src/bundle/Resources/translations
packages[form-builder]=vendor/ibexa/form-builder/src/bundle/Resources/translations
packages[site-context]=vendor/ibexa/site-context/src/bundle/Resources/translations
packages[fieldtype-matrix]=vendor/ibexa/fieldtype-matrix/src/bundle/Resources/translations
packages[activity-log]=vendor/ibexa/activity-log/src/bundle/Resources/translations
packages[storefront]=vendor/ibexa/storefront/src/bundle/Resources/translations
packages[connect]=vendor/ibexa/connect/src/bundle/Resources/translations
packages[automated-translation]=vendor/ibexa/automated-translation/src/bundle/Resources/translations
packages[fieldtype-richtext]=vendor/ibexa/fieldtype-richtext/src/bundle/Resources/translations
packages[fieldtype-address]=vendor/ibexa/fieldtype-address/src/bundle/Resources/translations
packages[connector-ai]=vendor/ibexa/connector-ai/src/bundle/Resources/translations
packages[connector-dam]=vendor/ibexa/connector-dam/src/bundle/Resources/translations
packages[permissions]=vendor/ibexa/permissions/src/bundle/Resources/translations
packages[image-editor]=vendor/ibexa/image-editor/src/bundle/Resources/translations
packages[page-builder]=vendor/ibexa/page-builder/src/bundle/Resources/translations
packages[corporate-account]=vendor/ibexa/corporate-account/src/bundle/Resources/translations
packages[fieldtype-query]=vendor/ibexa/fieldtype-query/src/bundle/Resources/translations
packages[core]=vendor/ibexa/core/src/bundle/Core/Resources/translations
packages[product-catalog-symbol-attribute]=vendor/ibexa/product-catalog-symbol-attribute/src/bundle/Resources/translations
packages[admin-ui]=vendor/ibexa/admin-ui/src/bundle/Resources/translations
packages[seo]=vendor/ibexa/seo/src/bundle/Resources/translations
packages[dashboard]=vendor/ibexa/dashboard/src/bundle/Resources/translations
packages[version-comparison]=vendor/ibexa/version-comparison/src/bundle/Resources/translations
packages[scheduler]=vendor/ibexa/scheduler/src/bundle/Resources/translations
packages[taxonomy]=vendor/ibexa/taxonomy/src/bundle/Resources/translations
packages[user]=vendor/ibexa/user/src/bundle/Resources/translations
packages[fieldtype-page]=vendor/ibexa/fieldtype-page/src/bundle/Resources/translations
packages[connector-unsplash]=vendor/ibexa/connector-unsplash/src/bundle/Resources/translations
packages[collaboration]=vendor/ibexa/collaboration/src/bundle/Resources/translations
packages[product-catalog-date-time-attribute]=vendor/ibexa/product-catalog-date-time-attribute/src/bundle/Resources/translations
packages[oauth2-server]=vendor/ibexa/oauth2-server/src/bundle/Resources/translations
packages[search]=vendor/ibexa/search/src/bundle/Resources/translations
packages[shipping]=vendor/ibexa/shipping/src/bundle/Resources/translations
packages[site-factory]=vendor/ibexa/site-factory/src/bundle/Resources/translations
packages[image-picker]=vendor/ibexa/image-picker/src/bundle/Resources/translations
packages[segmentation]=vendor/ibexa/segmentation/src/bundle/Resources/translations
packages[tree-builder]=vendor/ibexa/tree-builder/src/bundle/Resources/translations
packages[rest]=vendor/ibexa/rest/src/bundle/Resources/translations
packages[personalization]=vendor/ibexa/personalization/src/bundle/Resources/translations
packages[cart]=vendor/ibexa/cart/src/bundle/Resources/translations
packages[calendar]=vendor/ibexa/calendar/src/bundle/Resources/translations
packages[product-catalog]=vendor/ibexa/product-catalog/src/bundle/Resources/translations

BASE_DIR="$(dirname "$(realpath "$0")")/../../../.."

for key in "${!packages[@]}";
do
  destinationDir="$BASE_DIR/vendor/ibexa/i18n/$key/"
  destinationFiles="$BASE_DIR/vendor/ibexa/i18n/$key/*"
  if [ ! -d $destinationDir ]; then
    mkdir $destinationDir
  fi

  sourcePath="$BASE_DIR/${packages[$key]}"
  sourceFiles="$BASE_DIR/${packages[$key]}/*"
  if [ -d $sourcePath ]; then
    echo "# Processing ibexa/${key}"
    echo "# Removing existing files: $destinationFiles"
    rm -f $destinationFiles
    echo "# Copying $sourceFiles into $destinationDir"
    cp $sourceFiles $destinationDir
  else
    echo "# $sourcePath is not a directory"
  fi
done

echo "# Fixing .xlf extensions in $BASE_DIR/vendor/ibexa/i18n/*/*"
# uncomment this for OSX rename -s '.xliff' '.xlf' vendor/ezsystems/ezplatform-i18n/*/*
rename 's/\.xliff/.xlf/' $BASE_DIR/vendor/ibexa/i18n/*/*

echo '# Strip english locale suffix from filename';
# uncomment this for OSX  rename -s '.en' '' ./vendor/ezsystems/ezplatform-i18n/*/*
rename 's/\.en//' $BASE_DIR/vendor/ibexa/i18n/*/*

echo 'Translation synchronization done !';
