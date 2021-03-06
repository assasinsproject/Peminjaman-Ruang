/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bookingruang;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Viranda
 */
public class jadwalperkuliahan extends javax.swing.JFrame {
    public Connection conn = null;
    public Statement st = null;
    public ResultSet rst = null;
    public DefaultTableModel model;
    public PreparedStatement pst;
    public static int statusSearching = 0;
    /**
     * Creates new form jadwalperkuliahan
     */
    
    public jadwalperkuliahan() {
        initComponents();
        String[] header = {"Hari","Ruangan","Mata Kuliah","NIP","SKS","Waktu Selesai","Waktu Selesai"};
        model = new DefaultTableModel(header,0);
        tabeljadwal.setModel(model);
        daftarjadwal();
    }
    
    public void daftarjadwal(){
        try{
            String query = "SELECT hari,kd_ruang,kd_matkul,nip,sks,waktu_mulai,waktu_selesai FROM jadwal";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            int i = 1;
            while (rst.next()){
                String[] row = {rst.getString(1),rst.getString(2),rst.getString(3),
                                rst.getString(4),rst.getString(5),rst.getString(6),rst.getString(7)};
                model.addRow(row); 
                i++;
            }
            tabeljadwal.setModel(model);    
        }catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tabeljadwal = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        kembali = new javax.swing.JButton();
        isicari = new javax.swing.JTextField();
        cari = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tabeljadwal.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(tabeljadwal);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(53, 75, 718, 311));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel1.setText("Jadwal Umum Perkuliahan GKU");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(299, 31, -1, 26));

        kembali.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/left-arrow (1).png"))); // NOI18N
        kembali.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                kembaliMouseClicked(evt);
            }
        });
        kembali.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                kembaliActionPerformed(evt);
            }
        });
        getContentPane().add(kembali, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 11, -1, -1));
        getContentPane().add(isicari, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 400, 206, 26));

        cari.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/search.png"))); // NOI18N
        cari.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cariMouseClicked(evt);
            }
        });
        cari.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cariActionPerformed(evt);
            }
        });
        getContentPane().add(cari, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 400, 40, 30));

        jButton1.setText("Refresh");
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(700, 400, -1, 30));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/template.png"))); // NOI18N
        jLabel2.setPreferredSize(new java.awt.Dimension(812, 529));
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, -20, 810, 530));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void kembaliMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_kembaliMouseClicked
        adminvalidasi adm = new adminvalidasi();
                adm.setVisible(true);
                this.dispose();
    }//GEN-LAST:event_kembaliMouseClicked

    private void cariMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cariMouseClicked
        statusSearching=1;
            if(isicari.getText().isEmpty()){ 
                statusSearching = 0;
            }else if(statusSearching==1){
                String[] header = {"Hari","Ruangan","Mata Kuliah","NIP","SKS","Waktu Selesai","Waktu Selesai"};
                model = new DefaultTableModel(header,0);
                tabeljadwal.setModel(model);
                
                String search = isicari.getText();
                try{
                    String query = "SELECT hari,kd_ruang,kd_matkul,nip,sks,waktu_mulai,waktu_selesai FROM "
                                + "jadwal WHERE hari LIKE '"+search+"'"+ "OR kd_ruang LIKE '"+search+"' "
                                + "OR kd_matkul LIKE '"+search+"'"
                                + "OR nip LIKE '"+search+"' OR sks LIKE '"+search+"'"
                                + "OR waktu_mulai LIKE '"+search+"' OR waktu_selesai LIKE '"+search+"' "
                                + "ORDER BY hari";
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
                    pst = conn.prepareStatement(query);
                    
                    rst = pst.executeQuery(query);
                    
                    while(rst.next()){
                        String [] row = {rst.getString(1),rst.getString(2),rst.getString(3),
                                        rst.getString(4),rst.getString(5),rst.getString(6),rst.getString(7)};
                        model.addRow(row);
                    }
                    tabeljadwal.setModel(model);
                }catch(SQLException ex){
                    JOptionPane.showMessageDialog(rootPane, "Data yang dicari tidak ada !!!!");
                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                    JOptionPane.showMessageDialog(null, ex.getMessage());
                }
            }
    }//GEN-LAST:event_cariMouseClicked

    private void cariActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cariActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cariActionPerformed

    private void kembaliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_kembaliActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_kembaliActionPerformed

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked
        daftarjadwal();
    }//GEN-LAST:event_jButton1MouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(jadwalperkuliahan.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(jadwalperkuliahan.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(jadwalperkuliahan.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(jadwalperkuliahan.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new jadwalperkuliahan().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cari;
    private javax.swing.JTextField isicari;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton kembali;
    private javax.swing.JTable tabeljadwal;
    // End of variables declaration//GEN-END:variables

    private ResultSet executeQuery(String query) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
