#!/usr/bin/env bash
# Synchronize translation sources from all packages to i18n
echo '# Translation synchronization';

echo '# Mirror the translation files';

declare -A packages
packages[commerce-order-history]=vendor/ibexa/commerce-order-history/src/bundle/Resources/translations
packages[commerce-page-builder]=vendor/ibexa/commerce-page-builder/src/bundle/Resources/translations
packages[system-info]=vendor/ibexa/system-info/src/bundle/Resources/translations
packages[content-forms]=vendor/ibexa/content-forms/src/bundle/Resources/translations
packages[commerce-base-design]=vendor/ibexa/commerce-base-design/src/bundle/Resources/translations
packages[commerce-transaction-local-order-management]=vendor/ibexa/commerce-transaction/src/bundle/LocalOrderManagement/Resources/translations
packages[commerce-transaction-comparison]=vendor/ibexa/commerce-transaction/src/bundle/Comparison/Resources/translations
packages[commerce-transaction-voucher]=vendor/ibexa/commerce-transaction/src/bundle/Voucher/Resources/translations
packages[commerce-transaction-newsletter]=vendor/ibexa/commerce-transaction/src/bundle/Newsletter/Resources/translations
packages[commerce-transaction-quick-order]=vendor/ibexa/commerce-transaction/src/bundle/QuickOrder/Resources/translations
packages[commerce-transaction-shop-frontend]=vendor/ibexa/commerce-transaction/src/bundle/ShopFrontend/Resources/translations
packages[commerce-fieldtypes]=vendor/ibexa/commerce-fieldtypes/src/bundle/Resources/translations
packages[content-tree]=vendor/ibexa/content-tree/src/bundle/Resources/translations
packages[workflow]=vendor/ibexa/workflow/src/bundle/Resources/translations
packages[commerce-checkout]=vendor/ibexa/commerce-checkout/src/bundle/Resources/translations
packages[commerce-admin-ui]=vendor/ibexa/commerce-admin-ui/src/bundle/Resources/translations
packages[form-builder]=vendor/ibexa/form-builder/src/bundle/Resources/translations
packages[fieldtype-matrix]=vendor/ibexa/fieldtype-matrix/src/bundle/Resources/translations
packages[fieldtype-richtext]=vendor/ibexa/fieldtype-richtext/src/bundle/Resources/translations
packages[connector-dam]=vendor/ibexa/connector-dam/src/bundle/Resources/translations
packages[permissions]=vendor/ibexa/permissions/src/bundle/Resources/translations
packages[image-editor]=vendor/ibexa/image-editor/src/bundle/Resources/translations
packages[page-builder]=vendor/ibexa/page-builder/src/bundle/Resources/translations
packages[fieldtype-query]=vendor/ibexa/fieldtype-query/src/bundle/Resources/translations
packages[core]=vendor/ibexa/core/src/bundle/Core/Resources/translations
packages[admin-ui]=vendor/ibexa/admin-ui/src/bundle/Resources/translations
packages[commerce-price-engine]=vendor/ibexa/commerce-price-engine/src/bundle/Resources/translations
packages[version-comparison]=vendor/ibexa/version-comparison/src/bundle/Resources/translations
packages[scheduler]=vendor/ibexa/scheduler/src/bundle/Resources/translations
packages[taxonomy]=vendor/ibexa/taxonomy/src/bundle/Resources/translations
packages[user]=vendor/ibexa/user/src/bundle/Resources/translations
packages[fieldtype-page]=vendor/ibexa/fieldtype-page/src/bundle/Resources/translations
packages[commerce-shop-eshop]=vendor/ibexa/commerce-shop/src/bundle/Eshop/Resources/translations
packages[commerce-shop-search]=vendor/ibexa/commerce-shop/src/bundle/Search/Resources/translations
packages[commerce-shop-tools]=vendor/ibexa/commerce-shop/src/bundle/Tools/Resources/translations
packages[commerce-shop-specifications-type]=vendor/ibexa/commerce-shop/src/bundle/SpecificationsType/Resources/translations
packages[commerce-erp-admin]=vendor/ibexa/commerce-erp-admin/src/bundle/Resources/translations
packages[search]=vendor/ibexa/search/src/bundle/Resources/translations
packages[site-factory]=vendor/ibexa/site-factory/src/bundle/Resources/translations
packages[segmentation]=vendor/ibexa/segmentation/src/bundle/Resources/translations
packages[commerce-shop-ui]=vendor/ibexa/commerce-shop-ui/src/bundle/Resources/translations
packages[tree-builder]=vendor/ibexa/tree-builder/src/bundle/Resources/translations
packages[personalization]=vendor/ibexa/personalization/src/bundle/Resources/translations
packages[calendar]=vendor/ibexa/calendar/src/bundle/Resources/translations
packages[product-catalog]=vendor/ibexa/product-catalog/src/bundle/Resources/translations
packages[corporate-account]=vendor/ibexa/corporate-account/src/bundle/Resources/translations
packages[fieldtype-address]=vendor/ibexa/fieldtype-address/src/bundle/Resources/translations
packages[measurement]=vendor/ibexa/measurement/src/bundle/Resources/translations

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
