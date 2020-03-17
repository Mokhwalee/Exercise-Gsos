// VolEsti (volume computation and sampling library)

// Copyright (c) 2018 Vissarion Fisikopoulos, Apostolos Chalkis

//Contributed and/or modified by Apostolos Chalkis, as part of Google Summer of Code 2018 program.

// Licensed under GNU LGPL.3, see LICENCE file

#ifndef POINT_H
#define POINT_H

#include <iostream>

template <typename K>
class point
{
private:
    unsigned int d;
    typedef std::vector<typename K::FT> Coeff;
    Coeff coeffs;
    typedef typename std::vector<typename K::FT>::iterator iter;
public:
    typedef typename K::FT 	FT;

    point() {}
    
    point(const unsigned int &dim) {
        d = dim;
        coeffs = Coeff(d,0);
    }
    
    point(const unsigned int &dim, iter begin, iter endit) {
        d = dim;
        coeffs = Coeff(begin,endit);
    }

    point(const unsigned int dim, Coeff cofs) {
        d = dim;
        coeffs.assign(cofs.begin(), cofs.end());
    }
    
    int dimension() const {
        return d;
    }
    
    void set_dimension(const unsigned int &dim) {
        d = dim;
    }
    
    void set_coord(const unsigned int &i, const FT &coord) {
        coeffs[i] = coord;
    }

    Coeff get_coeffs() {
        return coeffs;
    }
    
    FT operator[] (const unsigned int &i) const {
        return coeffs[i];
    }
    
    point operator+ (point& p) {
        point temp(p.dimension());

        typename Coeff::iterator tmit = temp.iter_begin();
        typename Coeff::iterator pit = p.iter_begin();
        typename Coeff::iterator mit = coeffs.begin();

        for (; pit < p.iter_end(); ++pit, ++mit, ++tmit) {
            (*tmit) = (*pit) + (*mit);
        }
        return temp;
    }
    
    point operator- (point& p) {
        point temp(p.dimension());

        typename Coeff::iterator tmit = temp.iter_begin();
        typename Coeff::iterator pit = p.iter_begin();
        typename Coeff::iterator mit = coeffs.begin();

        for (; pit < p.iter_end(); ++pit, ++mit, ++tmit) {
            (*tmit) = (*mit) - (*pit);
        }
        return temp;
    }

    point operator* (const FT& k) {
        point temp(d, iter_begin(), iter_end());

        typename Coeff::iterator tmit = temp.iter_begin();

        for (; tmit < temp.iter_end(); ++tmit) {
            (*tmit) *= k;
        }
        return temp;
    }


    bool operator== (point& p) {

        typename Coeff::iterator pit = p.iter_begin();
        typename Coeff::iterator mit = coeffs.begin();

        /* degree of approximation in
        "The art of computer programming" (vol II), p. 234, Donald. E. Knuth. */
        FT e = 0.00000000001;

        for ( ;  pit!=p.iter_end(); ++pit, ++mit) {
            if (std::abs(*mit - *pit) > e * std::abs(*mit) ||
                std::abs(*mit - *pit) > e * std::abs(*pit))
                return false;
        }

        return true;
    }


    FT dot(point& p){
        FT res=FT(0.0);

        typename Coeff::iterator pit=p.iter_begin();
        typename Coeff::iterator mit=coeffs.begin();
        for( ; pit<p.iter_end(); ++pit, ++mit){
            res+=(*mit)*(*pit);
        }
        return res;
    }
    
    
    FT squared_length() {

        FT lsq = FT(0.0);

        typename Coeff::iterator mit=coeffs.begin();
        for ( ; mit != coeffs.end(); mit++){
            lsq += (*mit)*(*mit);
        }
        return lsq;
    }

    void print(){
        for(unsigned int i=0; i<d; i++){
            #ifdef VOLESTI_DEBUG
            std::cout<<coeffs[i]<<" ";
            #endif
        }
        #ifdef VOLESTI_DEBUG
        std::cout<<"\n";
        #endif
    }
    
    
    iter iter_begin() {
        return coeffs.begin();
    }
    
    iter iter_end() {
        return coeffs.end();
    }
    
    
};

template<typename K>
point<K> operator* (typename K::FT const& k, point<K>& p) {
    return p * k;
}

#endif
