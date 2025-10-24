awk '
  /<trans-unit/ { in_unit=1; src_indent=""; found_source=0; }
  /<\/trans-unit/ { in_unit=0; src_indent=""; found_source=0; }
  in_unit && /<source>/ {
    src_indent=substr($0, 1, match($0, /<source>/)-1);
    found_source=1;
    print $0;
    next
  }
  in_unit && /<target>/ && found_source {
    tgt_indent=substr($0, 1, match($0, /<target>/)-1);
    if (tgt_indent != src_indent) {
      $0 = src_indent substr($0, match($0, /<target>/));
    }
    print $0;
    found_source=0;
    next
  }
  { print $0 }
' /Users/tomaszdabrowski/github/i18n/translations/de_DE/admin-ui/ibexa_search.de.xlf > /Users/tomaszdabrowski/github/i18n/translations/de_DE/admin-ui/ibexa_search.de.xlf.preview
