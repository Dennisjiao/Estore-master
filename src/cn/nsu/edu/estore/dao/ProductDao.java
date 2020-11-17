package cn.nsu.edu.estore.dao;

import java.sql.SQLException;
import java.util.List;

import cn.nsu.edu.estore.domain.NodeDate;
import cn.nsu.edu.estore.domain.Product;

public interface ProductDao {
    //商品添加
    void addProduct(Product product) throws SQLException;

    //删除单个商品信息
    int delById(int id) throws SQLException;

    //批量删除勾选的客户信息
    void delSelect(int[] id) throws SQLException;

    //查询所有商品信息
    List<Product> findAll() throws SQLException;

    //通过id查找唯一商品  编辑商品信息
    Product findById(int id) throws SQLException;
    void update(Product p) throws SQLException;

    //按条件查询
    List<Product> simpleSelect(String field, String msg) throws SQLException;

    //分页查询
    List<Product> findByPage(int pageNum, int currentPage) throws SQLException;

    //得到所有页码
    int findAllCount() throws SQLException;

    //得到所属分类的页码
    int findCountByCode(String code) throws SQLException;

    //根据所传值得到在该分类的商品
    List<Product> findByCode(String code) throws SQLException;

}
