package com.prueba.sintad.config.security;

import com.prueba.sintad.ports.in.security.JWTServiceIn;
import com.prueba.sintad.ports.in.security.UsuarioServiceIn;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JWTServiceIn jwtServiceIn;
    private final UsuarioServiceIn usuarioServiceIn;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        final String autHeader = request.getHeader("Authorization");
        final String jwt;
        final String userEmail;

        if(StringUtils.isEmpty(autHeader) || !StringUtils.startsWithIgnoreCase(autHeader, "Bearer ")){
            filterChain.doFilter(request,response);
            return;
        }

        jwt = autHeader.substring(7);
        userEmail = jwtServiceIn.extractUserNameIn(jwt);

        if(Objects.nonNull(userEmail) && SecurityContextHolder.getContext().getAuthentication() == null){
            UserDetails userDetails = usuarioServiceIn.userDetailsServiceIn().loadUserByUsername(userEmail);
            if(jwtServiceIn.validateTokenIn(jwt,userDetails)){
                SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
                UsernamePasswordAuthenticationToken autToken = new UsernamePasswordAuthenticationToken(
                        userDetails,null,userDetails.getAuthorities()
                );
                autToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                securityContext.setAuthentication(autToken);
                SecurityContextHolder.setContext(securityContext);
            }

        }
        filterChain.doFilter(request,response);
    }
}
