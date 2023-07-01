package Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.Utente;

import Database.*;

public class UtenteDAO {

    private Database connection;

    
    public UtenteDAO(Database connection) {
        this.connection = connection;
    }

    public void createUtente(Utente utente) throws SQLException {
        PreparedStatement stmt = null;
        try {
            // Prepara la query di inserimento
        	Connection conn = connection.getConnection();
            String sql = "INSERT INTO utente (nome, cognome, email, password) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, utente.getName());
            stmt.setString(2, utente.getLastname());
            stmt.setString(3, utente.getEmail());
            stmt.setString(4, utente.getPassword());

            // Esegui la query di inserimento
            stmt.executeUpdate();
        } finally {
            // Chiudi il PreparedStatement
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    public Utente readUtente(int id) throws SQLException {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
        	 Connection conn = connection.getConnection();
            // Prepara la query di selezione
            String sql = "SELECT * FROM utente WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            // Esegui la query di selezione
            rs = stmt.executeQuery();
            if (rs.next()) {
                Utente utente = new Utente();
                utente.setId(rs.getInt("id"));
                utente.setName(rs.getString("nome"));
                utente.setLastname(rs.getString("cognome"));
                utente.setEmail(rs.getString("email"));
                utente.setPassword(rs.getString("password"));
                return utente;
            } else {
                return null;
            }
        } finally {
            // Chiudi il PreparedStatement e il ResultSet
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    public void updateUtente(Utente utente) throws SQLException {
        PreparedStatement stmt = null;
        try {
            // Prepara la query di aggiornamento
        	Connection conn = connection.getConnection();
            String sql = "UPDATE utente SET nome = ?, cognome = ?, email = ?, password = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, utente.getName());
            stmt.setString(2, utente.getLastname());
            stmt.setString(3, utente.getEmail());
            stmt.setString(4, utente.getPassword());
            stmt.setInt(5, utente.getId());

            // Esegui la query di aggiornamento
            stmt.executeUpdate();
        } finally {
            // Chiudi il PreparedStatement
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    public void deleteUtente(int id) throws SQLException {
        PreparedStatement stmt = null;
        try {
            // Prepara la query di cancellazione
        	Connection conn = connection.getConnection();
            String sql = "DELETE FROM utente WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            // Esegui la query di cancellazione
            stmt.executeUpdate();
        } finally {
            // Chiudi il PreparedStatement
            if (stmt != null) {
                stmt.close();
            }
        }
    }
}