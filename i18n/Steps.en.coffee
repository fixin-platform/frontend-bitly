i18n.addResourceBundle("en", "translation",
  Steps:
    ExportBitlyDataToGoogleSpreadsheet:
      icon: "bolt"
      default: "Enable automatic export of Bitly data to Google Drive"
      progressBars:
        CreateGoogleSpreadsheet:
          waiting: "Will create a Google Spreadsheet for Bitly links"
          connecting: "Connecting to Google Spreadsheet API"
          loading_simple: "Creating a Google Spreadsheet"
          loading_complex: "Creating a Google Spreadsheet"
          loaded_simple: "Created <a href='{{spreadsheet.link}}'>{{spreadsheet.name}}</a>"
          loaded_complex: "Created <a href='{{spreadsheet.link}}'>{{spreadsheet.name}}</a>"
          skipped_simple: "Reopened <a href='{{spreadsheet.link}}'>{{spreadsheet.name}}</a>"
          skipped_complex: "Reopened <a href='{{spreadsheet.link}}'>{{spreadsheet.name}}</a>"
          failed: "An error occurred while creating a Google Spreadsheet"
          cancelled: "Couldn't create a Google Spreadsheet because preceding tasks failed"
        DownloadBitlyLinks:
          waiting: "Will load Bitly links after finishing preceding tasks"
          connecting: "Connecting to Bitly API"
          loading_simple: "Loading Bitly links, {{current}} so far"
          loading_complex: "Loading Bitly links, {{current}} of {{total}} so far"
          loaded_simple: "Loaded Bitly links, {{current}} total"
          loaded_complex: "Loaded Bitly links, {{current}} of {{total}} total"
          failed: "An error occurred while loading Bitly links"
          cancelled: "Couldn't load Bitly links because preceding tasks failed"
        ExportBitlyDataToGoogleSpreadsheet:
          waiting: "Will export Bitly links after finishing preceding tasks"
          connecting: "Connecting to database"
          loading_simple: "Exporting Bitly links, {{current}} so far"
          loading_complex: "Exporting Bitly links, {{current}} of {{total}} so far"
          loaded_simple: "Exported Bitly links, {{current}} total"
          loaded_complex: "Exported Bitly links, {{current}} of {{total}} total"
          failed: "An error occurred while exporting Bitly links"
          cancelled: "Couldn't export Bitly links because preceding tasks failed"
, true)
