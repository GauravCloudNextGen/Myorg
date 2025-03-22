public class Candidate1TriggerHelper {
    public static void LinkSkills(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap) {
        Map<Id,List<String>> candidateSkillsMap = new Map<Id, List<String>>();
        Set<String> skillNames = new Set<String>();
        for (Candidate1__c c : triggerNew) {
            if (c.Skills__c != null) {
                List<String> skillsList = c.Skills__c.split(',');
                candidateSkillsMap.put(c.Id, skillsList);
                skillNames.addAll(skillsList);
            }
        }
        Map<String, Skill__c> skillMap = new Map<String, Skill__c>();
        for (Skill__c s : [SELECT Id, Name FROM Skill__c WHERE Name IN :skillNames]) {
            skillMap.put(s.Name, s);
        }
        List<Skill__c> newSkills = new List<Skill__c>();
        for (String skillName : skillNames) {
            if (!skillMap.containsKey(skillName)) {
                Skill__c newSkill = new Skill__c(Name = skillName);
                newSkills.add(newSkill);
            }
        }
        if (!newSkills.isEmpty()) {
            insert newSkills;
            for (Skill__c s : newSkills) {
                skillMap.put(s.Name, s);
            }
        }
        List<Candidate_Skill__c> candidateSkillList = new List<Candidate_Skill__c>();
        for (Candidate1__c c : triggerNew) {
            if (candidateSkillsMap.containsKey(c.Id)) {
                for (String skillName : candidateSkillsMap.get(c.Id)) {
                    if (skillMap.containsKey(skillName)) {
                        Candidate_Skill__c candidateSkill = new Candidate_Skill__c();
                        candidateSkill.Name = skillMap.get(skillName).Name;
                        candidateSkill.Candidate1__c = c.Id;
                        candidateSkill.Skill__c = skillMap.get(skillName).Id;
                        candidateSkillList.add(candidateSkill);
                    }
                }
            }
        }
        if (!candidateSkillList.isEmpty()) {
            insert candidateSkillList;
        }
    }
}