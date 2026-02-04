public class DynamicLeadSearch {
    public static void searchLeads(String userInput) {
        String leadQuery = 'SELECT Id, FirstName, LastName, Email FROM Lead WHERE ';
        if (userInput.contains('@')) {
            leadQuery += 'Email = \'' + userInput + '\'';
        } else {
            leadQuery += 'LastName = \'' + userInput + '\'';
        }
        List<Lead> foundLeads = Database.query(leadQuery);
        if (foundLeads.isEmpty()) {
            System.debug('No Leads found for: ' + userInput);
        } else {
            System.debug('Found ' + foundLeads.size() + ' Leads:');
            for (Lead l : foundLeads) {
                System.debug('Lead: ' + l.FirstName + ' ' + l.LastName + ', Email: ' + l.Email);
            }
        }
    }
}