program Cavity
    implicit none

    doubleprecision :: l , h , dx , dy , ree , resi , beta , u0 ,&
    er_si , er_w , er_max , re_u , re_v , nu , cxp , cxo , cxm ,&
    cyp , cyo , cym , w_w=0.2 , w_si=0.2
    integer :: i , j , n , m , iteration
    doubleprecision , allocatable :: x(:),y(:),w(:,:),si(:,:),w_old(:,:),si_old(:,:),u(:,:),v(:,:)

    open(19,file='input.txt')
    open(18,file='v.plt')
    open(17,file='u.plt')
    open(16,file='si.plt')
    open(15,file='omega.plt')

read(19,*)l
read(19,*)h
read(19,*)n
read(19,*)m
read(19,*)ree
read(19,*)resi
read(19,*)u0

allocate(x(n),y(m),w(n,m),si(n,m),w_old(n,m),si_old(n,m),u(n,m),v(n,m))

nu=l*u0/ree

!grid generation

dx=l/(n-1)
do i=1,n
    x(i)=(i-1)*dx
end do

dy=h/(m-1)
do j=1,m
    y(j)=(j-1)*dy
end do
beta= dx/dy

!initial guess

si(:,:)=0.0
do j=1,m
    w(:,j)=(-2.0*j*u0)/((m-1)*dy)
end do

iteration=0.0
do
    iteration= iteration + 1
    er_max=0.0
    er_si=0.0
    er_w=0.0
    si_old(:,:)=si(:,:)
    w_old(:,:)=w(:,:)

!boundary conditions

    do i=1,n
        u(i,1)=0.0
        v(i,1)=0.0
        si(i,1)=0.0
        w(i,1)=-2.0*si_old(i,2)/(dy**2.0)
    end do

    do i=1,n
        u(i,m)=u0
        v(i,m)=0.0
        si(i,m)=0.0
        w(i,m)=-2.0*(si_old(i,m-1)+u0*dy)/(dy**2.0)
    end do

    do j=1,m
        u(1,j)=0.0
        v(1,j)=0.0
        si(1,j)=0.0
        w(1,j)=-2.0*si_old(2,j)/(dx**2.0)
    end do

    do j=1,m
        u(n,j)=0.0
        v(n,j)=0.0
        si(n,j)=0.0
        w(n,j)= -2.0*si_old(n-1,j)/(dx**2.0)
    end do

    !inside

    do i=2,n-1
        do j=2,m-1

    !u and v

    u(i,j)=(si_old(i,j+1)-si_old(i,j-1))/(2.0*dy)
    v(i,j)=-(si_old(i+1,j)-si_old(i-1,j))/(2.0*dx)

    !si

si(i,j)=(si_old(i+1,j)+si_old(i-1,j)+(beta**2.0)*(si_old(i,j+1)+si_old(i,j-1))+(dx**2.0)*(w_old(i,j)))/(2.0*(1.0+beta**2.0))


!omega

re_u=u(i,j)*dx/nu
re_v=v(i,j)*dy/nu

if(re_u<=2.0)then
    cxp=0.5
    cxo=0.0
    cxm=-0.5
    elseif(re_u>2.0)then
        if(u(i,j)>0.0)then
            cxp=0.0
            cxo=-1.0
            cxm=-1.0
            else
            cxp=1.0
            cxo=1.0
            cxm=0.0
        end if
end if

if(re_v<=2.0)then
    cyp=0.5
    cyo=0.0
    cym=-0.5
    elseif(re_v>2.0)then
        if(v(i,j)>0.0)then
            cyp=0.0
            cyo=-1.0
            cym=-1.0
            else
                cyp=1.0
                cyo=1.0
                cym=0.0
        end if
end if

w(i,j)=0.5*(w_old(i+1,j)+ w(i-1,j)+beta*beta*(w_old(i,j+1)+w(i,j-1))-u(i,j)*dx/nu*(cxp*w_old(i+1,j)-&
cxo*w_old(i,j)+cxm*w(i-1,j))-v(i,j)*dy/nu*(cyp*w_old(i,j+1)-cyo*w_old(i,j)+cym*w(i,j-1)))/(1.0+beta*beta);

end do
end do

 !errors

 do i=1,n
    do j=1,m
        er_si= max(abs(si(i,j)-si_old(i,j)),er_si)
        er_w= max(abs(w(i,j)-w_old(i,j)),er_w)

 end do
 end do
 er_max= max(er_si,er_w)

 do i=1,n
    do j=1,m
        si(i,j)=si_old(i,j)+w_si*(si(i,j)-si_old(i,j))
        w(i,j)=w_old(i,j)+w_w*(w(i,j)-w_old(i,j))
 end do
end do

if(er_max<resi)exit

print * , iteration ,er_si,er_w
end do

write(18,*) 'variables = x , y , v zone i= ',m,'j=',n
do i=1,n
    do j=1,m
        write(18,*) x(i),y(j),v(i,j)
    end do
end do

write(17,*) 'variables = x , y , u zone i= ',m,'j=',n
do i=1,n
    do j=1,m
        write(17,*) x(i),y(j),u(i,j)
    end do
end do

write(16,*) 'variables = x , y , si zone i= ',m,'j=',n
do i=1,n
    do j=1,m
        write(16,*) x(i),y(j),si(i,j)
    end do
end do

write(15,*) 'variables = x , y , omega zone i= ',m,'j=',n
do i=1,n
    do j=1,m
        write(15,*) x(i),y(j),w(i,j)
    end do
end do

end program

