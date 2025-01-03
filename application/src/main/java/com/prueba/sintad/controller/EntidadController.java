package com.prueba.sintad.controller;

import com.prueba.sintad.aggregates.constants.Constants;
import com.prueba.sintad.aggregates.dto.EntidadDTO;
import com.prueba.sintad.aggregates.request.RequestSaveEntidad;
import com.prueba.sintad.aggregates.request.RequestUpdateEntidad;
import com.prueba.sintad.aggregates.response.ResponseApi;
import com.prueba.sintad.aggregates.response.ResponseApiList;
import com.prueba.sintad.aggregates.response.ResponseEntidad;
import com.prueba.sintad.aggregates.response.ResponseEntidadListPageable;

import com.prueba.sintad.ports.in.EntidadServiceIn;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/entidad")
@RequiredArgsConstructor
public class EntidadController {
    private final EntidadServiceIn entidadServiceIn;

    @GetMapping
    public ResponseEntity<ResponseApi<ResponseEntidadListPageable>> listEntidadPageableList(@RequestParam(value = "pageNo", defaultValue = Constants.NUM_PAG_BY_DEFECT, required = false) int pageNo,
                                                                                            @RequestParam(value = "pageSize", defaultValue = Constants.SIZE_PAG_BY_DEFECT, required = false) int pageSize,
                                                                                            @RequestParam(value = "sortBy", defaultValue = Constants.ORDER_BY_DEFECT_ALL, required = false) String sortBy,
                                                                                            @RequestParam(value = "sortDir", defaultValue = Constants.ORDER_DIRECT_BY_DEFECT, required = false) String sortDir){
        return ResponseEntity.ok(entidadServiceIn.findAllEntidadIn(pageNo, pageSize, sortBy, sortDir));
    }
    @GetMapping("/allDTO")
    public ResponseEntity<ResponseApiList<EntidadDTO>> listEntitiDTOList(){
        return ResponseEntity.ok(entidadServiceIn.finfAllEntidadIn());
    }
    @GetMapping("/{id}")
    public ResponseEntity<ResponseApi<ResponseEntidad>> getEntidadById(@PathVariable(value = "id") Integer id){
        return ResponseEntity.ok(entidadServiceIn.findEntidadByIdIn(id));
    }
    @PostMapping
    public ResponseEntity<ResponseApi<ResponseEntidad>> saveEntidad(@Valid @RequestBody RequestSaveEntidad requestSaveEntidad){
        return new ResponseEntity<>(entidadServiceIn.saveEntidadIn(requestSaveEntidad), HttpStatus.CREATED);
    }
    @PutMapping("/{id}")
    public ResponseEntity<ResponseApi<String>> updateEntidad(@PathVariable(value = "id") Integer id, @Valid @RequestBody RequestUpdateEntidad requestUpdateEntidad){
        return ResponseEntity.ok(entidadServiceIn.updateEntidadIn(requestUpdateEntidad,id));
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseApi<String>> deleteEntidad(@PathVariable(value = "id") Integer id){
        return ResponseEntity.ok(entidadServiceIn.deleteEntidadIn(id));
    }
}
