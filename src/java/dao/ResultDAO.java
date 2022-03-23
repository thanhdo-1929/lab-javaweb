package dao;

import entity.Result;

/**
 * This interface defines method used to retrieve information from database 
 * relating to <code>Result</code> object
 * <p>
 * Bugs: None
 */

public interface ResultDAO {
    
    /**
     * Insert result object into Result table. After taking the quiz, the 
     * results will be saved in Resutl table in database. 
     *
     * @param result the result object. It is a <code>Result</code> object
     * @throws java.lang.Exception
     */
    public void addResult (Result result) throws Exception;
}
