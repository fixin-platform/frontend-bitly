i18n.addResourceBundle("en", "translation",
  Steps:
    ExportBitlyDataToGoogleSpreadsheet:
      icon: "bolt"
      default: "Activate daily export of Bitly links and referrers to Google Spreadsheet"
      progressBars:
        CreateGoogleSpreadsheet:
          waiting: "Will create a Google Spreadsheet for Bitly links"
          connecting: "Connecting to Google Spreadsheet API"
          loading_simple: "Creating a Google Spreadsheet"
          loading_complex: "Creating a Google Spreadsheet"
          loaded_simple: "Created <a target=\"_blank\" href='{{spreadsheet.alternateLink}}'>{{spreadsheet.title}}</a>"
          loaded_complex: "Created <a target=\"_blank\" href='{{spreadsheet.alternateLink}}'>{{spreadsheet.title}}</a>"
          skipped: "Reused <a target=\"_blank\" href='{{spreadsheet.alternateLink}}'>{{spreadsheet.title}}</a>"
          failed: "An error occurred while creating a Google Spreadsheet"
          cancelled: "Couldn't create a Google Spreadsheet because preceding tasks failed"
        ExportBitlyDataToGoogleSpreadsheet:
          waiting: "Will export Bitly links after finishing preceding tasks"
          connecting: "Connecting to database"
          loading_simple: "Exporting Bitly links, {{current}} so far"
          loading_simple_message: "Exporting Bitly links, {{current}} so far <i>({{message}})</i>"
          loading_complex: "Exporting Bitly links, {{current}} of {{total}} so far"
          loading_complex_message: "Exporting Bitly links, {{current}} of {{total}} so far <i>({{message}})</i>"
          loaded_simple: "Exported Bitly links, {{current}} total"
          loaded_complex: "Exported Bitly links, {{current}} of {{total}} total"
          skipped: "Skipped exporting Bitly links"
          failed: "An error occurred while exporting Bitly links"
          cancelled: "Couldn't export Bitly links because preceding tasks failed"
, true)
