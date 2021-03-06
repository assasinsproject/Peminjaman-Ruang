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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JSpinner;
import javax.swing.SpinnerDateModel;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Viranda
 */
public class pinjam extends javax.swing.JFrame {
    public Connection conn = null;
    public Statement st = null ;
    public ResultSet rst;
    public DefaultTableModel model;
    public PreparedStatement pst;
    private String tgl;
    private String waktu;
    private String waktu1;
    
    /**
     * Creates new form pinjam
     */
    public pinjam() {
        initComponents();
        combo();
    }
    
    public void kembali (){
        Menu mn = new Menu();
                mn.setVisible(true);
                this.dispose();
    }
    public void combo(){
        try{
            String query = "SELECT kd_ruang FROM `ruang` where kd_ruang not in (SELECT kd_ruang from pinjam)";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            
            int i=1;
            while (rst.next()){
                String kode = rst.getString("kd_ruang");
                ruang.addItem(kode);
                i++;
            }
        }catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void hapuscombo(){
        int itemCount = ruang.getItemCount();

        for(int i=0;i<itemCount;i++){
        ruang.removeItemAt(0);
        }
    }
    
    public void peminjaman(){
        try{
            String query = "INSERT INTO pinjam (kd_ruang,tanggal,waktu_mulai,waktu_selesai,nim,keterangan) VALUES "
                            + "('"+ruang.getSelectedItem()+"','"+tgl+"','"+waktu+"','"+waktu1+"','"+nimpinjam.getText()
                            +"','"+keterangan.getText()+"')";
                conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
                pst = conn.prepareStatement(query);
                
                pst.executeUpdate(query);
                
                JOptionPane.showMessageDialog(this,"Peminjaman Berhasil!\nSilahkan tunggu validasi peminjaman\nDi menu awal");
                Menu mn = new Menu();
                mn.setVisible(true);
                this.dispose();
     
        }catch (SQLException ex) {
            JOptionPane.showMessageDialog(this,"Ruang terpakai!");
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }
    
    public void hari(){
        
        try{
            String query= "UPDATE pinjam SET hari = dayname(tanggal) WHERE tanggal ='"+tgl+"'";
                conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
                pst = conn.prepareStatement(query);
                
                pst.executeUpdate(query);
     
        }catch (SQLException ex) {
            JOptionPane.showMessageDialog(this,"Gagal!");
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex.getMessage());
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

        jLabel1 = new javax.swing.JLabel();
        ruang = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        keterangan = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        pinjam = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        Date date = new Date();
        SpinnerDateModel sm =
        new SpinnerDateModel(date, null, null, Calendar.HOUR_OF_DAY);
        Jamspin = new javax.swing.JSpinner(sm);
        Date dat = new Date();
        SpinnerDateModel ms =
        new SpinnerDateModel(date, null, null, Calendar.HOUR_OF_DAY);
        Jamspin1 = new javax.swing.JSpinner(ms);
        jLabel6 = new javax.swing.JLabel();
        nimpinjam = new javax.swing.JTextField();
        tanggal = new com.toedter.calendar.JDateChooser();
        rbesar = new javax.swing.JButton();
        rkecil = new javax.swing.JButton();
        aula = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Peminjaman Ruang Gedung Kuliah Umum");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(244, 11, 256, 36));

        getContentPane().add(ruang, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 90, 320, -1));

        jLabel2.setText("Ruang");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(202, 87, 68, 26));

        jLabel3.setText("Tanggal");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 170, 47, 26));

        jLabel4.setText("Waktu Mulai");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 220, -1, -1));
        getContentPane().add(keterangan, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 340, 318, -1));

        jLabel7.setText("Keterangan");
        getContentPane().add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 340, -1, -1));

        pinjam.setText("Pinjam");
        pinjam.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                pinjamMouseClicked(evt);
            }
        });
        getContentPane().add(pinjam, new org.netbeans.lib.awtextra.AbsoluteConstraints(553, 440, -1, -1));

        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/left-arrow (1).png"))); // NOI18N
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 11, -1, -1));

        jLabel5.setText("Waktu Selesai");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 280, 68, -1));

        JSpinner.DateEditor de = new JSpinner.DateEditor(Jamspin, "HH:mm");
        Jamspin.setEditor(de);
        Jamspin.addChangeListener(new javax.swing.event.ChangeListener() {
            public void stateChanged(javax.swing.event.ChangeEvent evt) {
                JamspinStateChanged(evt);
            }
        });
        getContentPane().add(Jamspin, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 210, 123, 35));

        JSpinner.DateEditor ed = new JSpinner.DateEditor(Jamspin1, "HH:mm");
        Jamspin1.setEditor(ed);
        Jamspin1.addChangeListener(new javax.swing.event.ChangeListener() {
            public void stateChanged(javax.swing.event.ChangeEvent evt) {
                Jamspin1StateChanged(evt);
            }
        });
        getContentPane().add(Jamspin1, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 270, 123, 37));

        jLabel6.setText("NIM");
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 390, 68, 24));
        getContentPane().add(nimpinjam, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 390, 318, -1));

        tanggal.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                tanggalPropertyChange(evt);
            }
        });
        getContentPane().add(tanggal, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 170, 320, -1));

        rbesar.setText("R.besar");
        rbesar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                rbesarMouseClicked(evt);
            }
        });
        getContentPane().add(rbesar, new org.netbeans.lib.awtextra.AbsoluteConstraints(450, 120, -1, -1));

        rkecil.setText("R.kecil");
        rkecil.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                rkecilMouseClicked(evt);
            }
        });
        getContentPane().add(rkecil, new org.netbeans.lib.awtextra.AbsoluteConstraints(373, 120, 70, -1));

        aula.setText("Aula");
        aula.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                aulaMouseClicked(evt);
            }
        });
        getContentPane().add(aula, new org.netbeans.lib.awtextra.AbsoluteConstraints(530, 120, 80, -1));

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/pict/images/template.png"))); // NOI18N
        jLabel8.setPreferredSize(new java.awt.Dimension(812, 529));
        getContentPane().add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, -20, 810, 530));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void pinjamMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_pinjamMouseClicked
        peminjaman();
        hari();
    }//GEN-LAST:event_pinjamMouseClicked

    private void tanggalPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_tanggalPropertyChange
        // TODO add your handling code here:
        if(tanggal.getDate()!=null){
            SimpleDateFormat format_tgl = new SimpleDateFormat("yyyy-MM-dd");
            tgl = format_tgl.format(tanggal.getDate());
        }
    }//GEN-LAST:event_tanggalPropertyChange

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked
        // TODO add your handling code here:
        Menu mn = new Menu();
                mn.setVisible(true);
                this.dispose();
    }//GEN-LAST:event_jButton1MouseClicked

    private void JamspinStateChanged(javax.swing.event.ChangeEvent evt) {//GEN-FIRST:event_JamspinStateChanged
        // TODO add your handling code here:
        SimpleDateFormat format_jam = new SimpleDateFormat("HH:mm");
        waktu = format_jam.format(Jamspin.getValue());
    }//GEN-LAST:event_JamspinStateChanged

    private void Jamspin1StateChanged(javax.swing.event.ChangeEvent evt) {//GEN-FIRST:event_Jamspin1StateChanged
        // TODO add your handling code here:
        SimpleDateFormat format_jam = new SimpleDateFormat("HH:mm");
        waktu1 = format_jam.format(Jamspin1.getValue());
    }//GEN-LAST:event_Jamspin1StateChanged

    private void rkecilMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_rkecilMouseClicked
        try{
            hapuscombo();
            String query = "SELECT kd_ruang FROM ruang where kapasitas=(SELECT min(kapasitas) from ruang)";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            
            int i=1;
            while (rst.next()){
                String kode = rst.getString("kd_ruang");
                ruang.addItem(kode);
                i++;
            }
        }catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_rkecilMouseClicked

    private void rbesarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_rbesarMouseClicked
        try{
            hapuscombo();
            String query = "SELECT kd_ruang FROM ruang where jns_ruang='R.Besar'";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            
            int i=1;
            while (rst.next()){
                String kode = rst.getString("kd_ruang");
                ruang.addItem(kode);
                i++;
            }
        }catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_rbesarMouseClicked

    private void aulaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_aulaMouseClicked
        try{
            hapuscombo();
            String query = "SELECT kd_ruang FROM ruang where kapasitas=(SELECT max(kapasitas) from ruang)";
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bookingruang","root","");
            pst = conn.prepareStatement(query);
            
            rst = pst.executeQuery();
            
            int i=1;
            while (rst.next()){
                String kode = rst.getString("kd_ruang");
                ruang.addItem(kode);
                i++;
            }
        }catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_aulaMouseClicked

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
            java.util.logging.Logger.getLogger(pinjam.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(pinjam.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(pinjam.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(pinjam.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new pinjam().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JSpinner Jamspin;
    public javax.swing.JSpinner Jamspin1;
    private javax.swing.JButton aula;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JTextField keterangan;
    private javax.swing.JTextField nimpinjam;
    private javax.swing.JButton pinjam;
    private javax.swing.JButton rbesar;
    private javax.swing.JButton rkecil;
    private javax.swing.JComboBox<String> ruang;
    private com.toedter.calendar.JDateChooser tanggal;
    // End of variables declaration//GEN-END:variables
}
