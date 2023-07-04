package model.DAO;

import model.domain.food;
import java.util.List;

public interface IFoodDAO {
    public List<food> search(String keyword) throws Exception;
    public List<food> findAll() throws Exception;
}
