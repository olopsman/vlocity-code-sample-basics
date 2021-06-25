global class AccountRemoteClass implements vlocity_cmt.VlocityOpenInterface {
        
    // default implementation method
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
		Boolean result = false;
        try {
            // check methodName
            if(methodName == 'getAccountRecords') {
            	getAccountRecords(outMap);
	            result = true;
            }
        } catch(Exception e) {
            system.debug('The error is ' + e.getMessage());
        }
        return result;
    }
    // argument of outMap to be populated with query results
    private void getAccountRecords(Map<String,Object> outMap) {
        List<Account> accountList = [SELECT Id, Name, Website, Phone FROM Account LIMIT 10];
        outMap.put('account', accountList);
    }
}