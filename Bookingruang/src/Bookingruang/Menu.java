package Bookingruang;


import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author microsoft
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

public class Menu extends javax.swing.JFrame {
    public Connection conn = null;
    public Statement st = null;
    public ResultSet rst = null;
    public DefaultTableModel model;
    public DefaultTableModel model1;
    public PreparedStatement pst;
    
    /**
     * Creates new form Menu
     */
    public Menu() {
        initComponents();
        String[] header = {"Ruang","Jenis Ruangan","Kapasitas"};
        model = new DefaultTableModel(header,0);
        tabel.setModel(model);
        daftarkosong();
        
        String[] header1 = {"Ruang","Tanggal","Waktu Mulai","Waktu Selesai","Keterangan","Status"};
        model1 = new DefaultTableModel(header1,0);
        tabel1.setModel(model1);
        daftarpinjam();
    }
    
    public void daftarkosong(){
        try{
            String query = "SELECT * FROM ruang where kd_ruang not in (SELECT kd_ruang from pinjam)";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            int i = 1;
            while (rst.next()){
                String[] row = {rst.getString(1),rst.getString(2),rst.getString(3)};
                model.addRow(row); 
                i++;
            }
            tabel.setModel(model);    
        }catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void daftarpinjam(){
        try{
            String query = "SELECT kd_ruang,tanggal,waktu_mulai,waktu_selesai,keterangan,status FROM pinjam";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            int i = 1;
            while (rst.next()){
                String[] row = {rst.getString(1),rst.getString(2),rst.getString(3),rst.getString(4),
                                rst.getString(5),rst.getString(6)};
                model1.addRow(row); 
                i++;
            }
            tabel1.setModel(model1);    
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

        jadwal = new javax.swing.JScrollPane();
        tabel = new javax.swing.JTable();
        judul = new javax.swing.JLabel();
        jadwal1 = new javax.swing.JScrollPane();
        tabel1 = new javax.swing.JTable();
        judul1 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jMenuBar2 = new javax.swing.JMenuBar();
        menu = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        logout = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        setPreferredSize(new java.awt.Dimension(812, 529));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tabel.setModel(new javax.swing.table.DefaultTableModel(
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
        jadwal.setViewportView(tabel);

        getContentPane().add(jadwal, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 56, 665, 130));

        judul.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        judul.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        judul.setText("Daftar Ruang Kosong Pada Gedung Kuliah Umum");
        getContentPane().add(judul, new org.netbeans.lib.awtextra.AbsoluteConstraints(65, 11, 690, 34));

        tabel1.setModel(new javax.swing.table.DefaultTableModel(
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
        jadwal1.setViewportView(tabel1);

        getContentPane().add(jadwal1, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 244, 665, 168));

        judul1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        judul1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        judul1.setText("Daftar Peminjaman Ruang");
        getContentPane().add(judul1, new org.netbeans.lib.awtextra.AbsoluteConstraints(65, 204, 690, 34));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/template.png"))); // NOI18N
        jLabel1.setPreferredSize(new java.awt.Dimension(820, 529));
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, -20, -1, -1));

        jMenuBar2.setPreferredSize(new java.awt.Dimension(146, 26));

        menu.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED, java.awt.Color.gray, java.awt.Color.gray, java.awt.Color.gray, java.awt.Color.gray));
        menu.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/list.png"))); // NOI18N
        menu.setText("Menu");
        menu.setToolTipText("");
        menu.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jMenuItem1.setText("Peminjaman Ruang");
        jMenuItem1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jMenuItem1MouseClicked(evt);
            }
        });
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        menu.add(jMenuItem1);

        jMenuItem2.setText("Pembatalan Peminjaman");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        menu.add(jMenuItem2);

        jMenuBar2.add(menu);

        logout.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED, null, null, null, java.awt.Color.gray));
        logout.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/logout.png"))); // NOI18N
        logout.setText("Log out");
        logout.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                logoutMouseClicked(evt);
            }
        });
        logout.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                logoutActionPerformed(evt);
            }
        });
        jMenuBar2.add(logout);

        setJMenuBar(jMenuBar2);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void logoutActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_logoutActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_logoutActionPerformed

    private void logoutMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_logoutMouseClicked
        // TODO add your handling code here:
        login log = new login();
        int pesan=JOptionPane.showConfirmDialog(null, "Yakin ?","Konfirmasi",JOptionPane.YES_NO_OPTION,
                JOptionPane.QUESTION_MESSAGE);
        if (pesan==JOptionPane.YES_OPTION){
            log.setVisible(true);
            this.dispose();
        }
    }//GEN-LAST:event_logoutMouseClicked

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        pinjam pj = new pinjam();
        pj.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jMenuItem1MouseClicked
        // TODO add your handling code here:
        
    }//GEN-LAST:event_jMenuItem1MouseClicked

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:
        batal bt = new batal();
        bt.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jMenuItem2ActionPerformed

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
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Menu().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JScrollPane jadwal;
    private javax.swing.JScrollPane jadwal1;
    private javax.swing.JLabel judul;
    private javax.swing.JLabel judul1;
    private javax.swing.JMenu logout;
    private javax.swing.JMenu menu;
    private javax.swing.JTable tabel;
    private javax.swing.JTable tabel1;
    // End of variables declaration//GEN-END:variables
}
