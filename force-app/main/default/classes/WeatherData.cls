public with sharing class WeatherData {
	@AuraEnabled(Cacheable=true)
    public static string getWeather(String City){
        string endpoint = 'https://api.collectapi.com/weather/getWeather?data.lang=Engl&data.city='+City;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('authorization', 'apikey 0SZxBkYPJudCAslX8FspVh:69lD2nq0c6HlLxAbs1kSZj');
        request.setTimeout(10000);
        try {   
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 200) {
                System.debug(response.getBody());
                return response.getBody();
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