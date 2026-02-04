public with sharing class IMDBData {
    @AuraEnabled(cacheable=true)
    public static string getMovies(string searchText){
         String endpoint = 'https://api.collectapi.com/imdb/imdbSearchByName?query='+searchText;

        // Create HTTP request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('authorization', 'apikey 0SZxBkYPJudCAslX8FspVh:69lD2nq0c6HlLxAbs1kSZj');
        request.setTimeout(10000); // Timeout in milliseconds

        try {   
            // Send request and get response
            HttpResponse response = http.send(request);

            // Check response status
            if (response.getStatusCode() == 200) {
                return response.getBody(); // Successful response
            } else {
                System.debug('Error: ' + response.getStatus());
                return 'Error: ' + response.getStatus();
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
            return 'Exception: ' + e.getMessage();
        }
    }
}