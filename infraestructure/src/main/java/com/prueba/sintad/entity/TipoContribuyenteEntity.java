package com.prueba.sintad.entity;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tb_tipo_contribuyente")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TipoContribuyenteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tipo_contribuyente")
    private Integer id;

    @Column(name = "nombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "estado", nullable = false)
    private Boolean estado;
}
