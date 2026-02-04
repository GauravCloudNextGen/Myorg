public class SelectAccountController {
    // Public property to store selected record IDs
    public List<Id> selectedRecordIds { get; set; }

    // Constructor to initialize the list
    public SelectAccountController() {
        selectedRecordIds = new List<Id>();
    }

    // Method to process selected records
    public PageReference processSelectedRecords() {
        // Retrieve selected record IDs from the URL parameter
        String selectedIds = ApexPages.currentPage().getParameters().get('selectedIds');
        
        // Check if any records were selected
        if (selectedIds != null && selectedIds != '') {
            // Split the comma-separated string into a list of IDs
            selectedRecordIds = selectedIds.split(',');

            // Debug the selected IDs
            System.debug('Selected Record IDs: ' + selectedRecordIds);
        } else {
            System.debug('No records selected.');
        }

        // Return null to stay on the same page
        return null;
    }
}