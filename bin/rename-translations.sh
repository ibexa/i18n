#!/usr/bin/env bash
# Synchronize translation sources from all packages to i18n
echo '# Translation renaming';

declare -A packages
packages[commerce-order-history]=ezcommerce-order-history
packages[commerce-page-builder]=ibexa-commerce-page-builder
packages[system-info]=ibexa-system-info
packages[content-forms]=ezplatform-content-forms
packages[commerce-base-design]=ezcommerce-base-design
packages[commerce-transaction-local-order-management]=ezcommerce-shop-local-order-management
packages[commerce-transaction-voucher]=ezcommerce-shop-voucher
packages[commerce-transaction-newsletter]=ezcommerce-shop-newsletter
packages[commerce-transaction-quick-order]=ezcommerce-shop-quick-order
packages[commerce-fieldtypes]=ezcommerce-fieldtypes
packages[workflow]=ezplatform-workflow
packages[commerce-checkout]=ezcommerce-checkout
packages[commerce-admin-ui]=ezcommerce-admin-ui
packages[form-builder]=ezplatform-form-builder
packages[fieldtype-matrix]=ezplatform-matrix-fieldtype
packages[fieldtype-richtext]=ezplatform-richtext
packages[connector-dam]=ezplatform-connector-dam
packages[permissions]=ezplatform-permissions
packages[image-editor]=ibexa-platform-image-editor
packages[page-builder]=ezplatform-page-builder
packages[fieldtype-query]=ezplatform-query-fieldtype
packages[core]=ezplatform-kernel
packages[admin-ui]=ezplatform-admin-ui
packages[commerce-price-engine]=ezcommerce-price-engine
packages[version-comparison]=ezplatform-version-comparison
packages[scheduler]=date-based-publisher
packages[user]=ezplatform-user
packages[fieldtype-page]=ezplatform-page-fieldtype
packages[commerce-shop-eshop]=ezcommerce-shop-eshop
packages[commerce-shop-search]=ezcommerce-shop-search
packages[commerce-shop-tools]=ezcommerce-shop-tools
packages[commerce-shop-specifications-type]=ezcommerce-shop-specifications-type
packages[commerce-erp-admin]=ezcommerce-erp-admin
packages[search]=ezplatform-search
packages[site-factory]=ezplatform-site-factory
packages[segmentation]=ezplatform-segmentation
packages[tree-builder]=ibexa-tree-builder
packages[personalization]=ibexa-personalization
packages[calendar]=ezplatform-calendar
packages[product-catalog]=ibexa-product-catalog
packages[commerce-checkout]=ezcommerce-shop-checkout
packages[commerce-transaction-comparison]=ezcommerce-shop-comparison
packages[taxonomy]=ibexa-taxonomy
packages[commerce-shop-ui]=ibexa-commerce-shop-ui

for key in "${!packages[@]}";
do
  destinationName="$key"
  fromName="${packages[$key]}"

  mv $fromName $destinationName

  rm -rf ezpublish-kernel
  rm -rf ez-support-tools
  rm -rf ibexa-commerce-shop-frontend
done


echo 'Renaming of translation folders done !';
