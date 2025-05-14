package comparadorweb.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.Categoria;
import comparadorweb.repository.CategoriaRepository;

@Repository
public class CategoriaDaoImpl implements CategoriaDao{
	
	@Autowired
    private CategoriaRepository caterepo;

	@Override
	public List<Categoria> buscarTodos() {
		// TODO Auto-generated method stub
		return caterepo.findAll();
	}

}
