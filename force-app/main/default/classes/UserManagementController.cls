public with sharing class UserManagementController {
    
    /**
     * Get all active users with their basic information
     * @return List<User> List of users with selected fields
     */
    @AuraEnabled(cacheable=true)
    public static List<User> getUsers() {
        try {
            return [
                SELECT Id, FirstName, LastName, Email, Phone, Title, Department, 
                       IsActive, Username, Profile.Name, Manager.Name
                FROM User 
                WHERE IsActive = true 
                ORDER BY FirstName, LastName
                LIMIT 1000
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching users: ' + e.getMessage());
        }
    }
    
    /**
     * Create a new user
     * @param userData Map containing user field values
     * @return User The created user record
     */
    @AuraEnabled
    public static User createUser(Map<String, Object> userData) {
        try {
            // Check if user has permission to create users
            if (!Schema.SObjectType.User.isCreateable()) {
                throw new AuraHandledException('Insufficient permissions to create users');
            }
            
            User newUser = new User();
            
            // Set basic fields
            newUser.FirstName = (String) userData.get('FirstName');
            newUser.LastName = (String) userData.get('LastName');
            newUser.Email = (String) userData.get('Email');
            newUser.Phone = (String) userData.get('Phone');
            newUser.Title = (String) userData.get('Title');
            newUser.Department = (String) userData.get('Department');
            
            // Set required fields for new user
            newUser.Username = (String) userData.get('Email');
            newUser.Alias = (String) userData.get('Alias');
            newUser.ProfileId = (Id) userData.get('ProfileId');
            newUser.EmailEncodingKey = 'UTF-8';
            newUser.LanguageLocaleKey = 'en_US';
            newUser.LocaleSidKey = 'en_US';
            newUser.TimeZoneSidKey = 'America/New_York';
            
            // Set manager if provided
            if (userData.containsKey('ManagerId') && userData.get('ManagerId') != null) {
                newUser.ManagerId = (Id) userData.get('ManagerId');
            }
            
            insert newUser;
            return newUser;
            
        } catch (Exception e) {
            throw new AuraHandledException('Error creating user: ' + e.getMessage());
        }
    }
    
    /**
     * Update an existing user
     * @param userId The ID of the user to update
     * @param userData Map containing user field values to update
     * @return User The updated user record
     */
    @AuraEnabled
    public static User updateUser(Id userId, Map<String, Object> userData) {
        try {
            // Check if user has permission to update users
            if (!Schema.SObjectType.User.isUpdateable()) {
                throw new AuraHandledException('Insufficient permissions to update users');
            }
            
            User userToUpdate = new User(Id = userId);
            
            // Update fields if provided
            if (userData.containsKey('FirstName')) {
                userToUpdate.FirstName = (String) userData.get('FirstName');
            }
            if (userData.containsKey('LastName')) {
                userToUpdate.LastName = (String) userData.get('LastName');
            }
            if (userData.containsKey('Email')) {
                userToUpdate.Email = (String) userData.get('Email');
            }
            if (userData.containsKey('Phone')) {
                userToUpdate.Phone = (String) userData.get('Phone');
            }
            if (userData.containsKey('Title')) {
                userToUpdate.Title = (String) userData.get('Title');
            }
            if (userData.containsKey('Department')) {
                userToUpdate.Department = (String) userData.get('Department');
            }
            if (userData.containsKey('ManagerId')) {
                userToUpdate.ManagerId = (Id) userData.get('ManagerId');
            }
            
            update userToUpdate;
            
            // Return the updated user
            return [SELECT Id, FirstName, LastName, Email, Phone, Title, Department, 
                           IsActive, Username, Profile.Name, Manager.Name
                    FROM User 
                    WHERE Id = :userId];
            
        } catch (Exception e) {
            throw new AuraHandledException('Error updating user: ' + e.getMessage());
        }
    }
    
    /**
     * Get available profiles for user creation
     * @return List<Profile> List of available profiles
     */
    @AuraEnabled(cacheable=true)
    public static List<Profile> getAvailableProfiles() {
        try {
            return [
                SELECT Id, Name, Description
                FROM Profile 
                WHERE UserType = 'Standard'
                ORDER BY Name
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching profiles: ' + e.getMessage());
        }
    }
    
    /**
     * Get available managers for user assignment
     * @return List<User> List of users who can be managers
     */
    @AuraEnabled(cacheable=true)
    public static List<User> getAvailableManagers() {
        try {
            return [
                SELECT Id, FirstName, LastName, Email, Title
                FROM User 
                WHERE IsActive = true 
                ORDER BY FirstName, LastName
                LIMIT 100
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching managers: ' + e.getMessage());
        }
    }
    
    /**
     * Deactivate a user
     * @param userId The ID of the user to deactivate
     * @return Boolean True if successful
     */
    @AuraEnabled
    public static Boolean deactivateUser(Id userId) {
        try {
            // Check if user has permission to update users
            if (!Schema.SObjectType.User.isUpdateable()) {
                throw new AuraHandledException('Insufficient permissions to update users');
            }
            
            User userToDeactivate = new User(Id = userId, IsActive = false);
            update userToDeactivate;
            
            return true;
            
        } catch (Exception e) {
            throw new AuraHandledException('Error deactivating user: ' + e.getMessage());
        }
    }
}