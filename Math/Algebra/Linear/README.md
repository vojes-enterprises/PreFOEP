



## Motivation: What is Linear Algebra useful for? 

Linear Algebra is arguably the most applicable math subject there is. It is used in almost every aspect of your life. Here are a few examples to motivate you to learn more about it.

### Computer Science Applications

---

**Google is just Linear Algebra**
Have you ever thought about why Google is the number one search engine? 
The main reason is because it is *so* good at ranking webpages in order of relevance when you search some words. 

**The $25,000,000,000 Eigenvector, The Linear Algebra Behind Google:**
**Paper:** https://www.rose-hulman.edu/~bryan/googleFinalVersionFixed.pdf

---

**Robotic Coordinate Frames**

In robotics, coordinate frames are extremely important. 
Let's consider a problem. I give you a robotic arm like the one below:



<img src="./docs/robot_arm.jpg"
     alt="Robot Arm"
     style="width:160px; margin-left:15px;" />



And I task you to make it pick up a coffee mug off a table. 
Where do we even start? 

First, we define an *origin*, think of the cartesian 3D coordinate system. 

Then we define the *position*, a **vector** of three numbers, *x*,*y*,*z*. Defined as being how far the origin of our arm has moved from an initial position.

And finally, we define an *orientation* vector. *roll*,*pitch*,*yaw*.

The *position* and *orientation* together are a **pose**.

The use for these frames are to know where our arm is with respect to everything else. With our example, it may not seem to complicated, but there are applications where there are tens to hundreds of frames that need to be kept track of so there are no unintended collisions or mishaps.
This is all done with *vectors*, *matrices*, *linear transformations*, and some more linear algebra. 

---

So, now hopefully you are effectively motivated to learn more about linear algebra. But before we dive in, there are some necessary prerequisites.

## Prerequisites
1.) Discrete Math
- Mainly you want to be exposed to some proof techniques before you start linear algebra,
- Also helpful to understand *fields*<sup>1*</sup>

2.) Basic trig
  

1* https://en.wikipedia.org/wiki/Field_(mathematics)



---

# The building blocks of Linear Algebra
#### Table of Contents:

-Vectors
-Matrices
-Linear Transformations

## Vectors 

To start our journey with linear algebra, we have to begin with the most basic building block, the **vector**.
In their most basic sense, a vector can be thought of a set of coordinates in a cartesian coordinate system. 


<a href="https://www.codecogs.com/eqnedit.php?latex=v&space;\in&space;\mathbb{R}^3,v=\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?v&space;\in&space;\mathbb{R}^3,v=\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}" title="v \in \mathbb{R}^3,v=\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}" /></a>


### Vectors have a few defined operations
- Addition
- Scalar Multiplication

Addition is defined entry wise:

<a href="https://www.codecogs.com/eqnedit.php?latex=v,w&space;\in&space;\mathbb{R}^3&space;,&space;v&plus;w=&space;\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;&plus;&space;\begin{pmatrix}w_1\\w_2\\w_3\end{pmatrix}&space;=&space;\begin{pmatrix}&space;v_1&space;&plus;&space;w_1\\v_2&space;&plus;&space;w_2\\v_3&space;&plus;&space;w_3&space;\end{pmatrix}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?v,w&space;\in&space;\mathbb{R}^3&space;,&space;v&plus;w=&space;\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;&plus;&space;\begin{pmatrix}w_1\\w_2\\w_3\end{pmatrix}&space;=&space;\begin{pmatrix}&space;v_1&space;&plus;&space;w_1\\v_2&space;&plus;&space;w_2\\v_3&space;&plus;&space;w_3&space;\end{pmatrix}" title="v,w \in \mathbb{R}^3 , v+w= \begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} + \begin{pmatrix}w_1\\w_2\\w_3\end{pmatrix} = \begin{pmatrix} v_1 + w_1\\v_2 + w_2\\v_3 + w_3 \end{pmatrix}" /></a>


And scalar multiplication is defined as:



<a href="https://www.codecogs.com/eqnedit.php?latex=c&space;\in&space;\mathbb{R}&space;,&space;cv&space;=&space;c\begin{pmatrix}&space;v_1\\&space;v_2\\&space;v_3&space;\end{pmatrix}&space;=&space;\begin{pmatrix}&space;cv_1\\&space;cv_2\\&space;cv_3&space;\end{pmatrix}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?c&space;\in&space;\mathbb{R}&space;,&space;cv&space;=&space;c\begin{pmatrix}&space;v_1\\&space;v_2\\&space;v_3&space;\end{pmatrix}&space;=&space;\begin{pmatrix}&space;cv_1\\&space;cv_2\\&space;cv_3&space;\end{pmatrix}" title="c \in \mathbb{R} , cv = c\begin{pmatrix} v_1\\ v_2\\ v_3 \end{pmatrix} = \begin{pmatrix} cv_1\\ cv_2\\ cv_3 \end{pmatrix}" /></a>

### Linear Combinations

<a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{Let&space;}&space;V&space;\textrm{&space;be&space;a&space;set&space;of&space;}&space;$n$&space;\textrm{&space;vectors&space;in&space;}&space;$\mathbb{R}^n$." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{Let&space;}&space;V&space;\textrm{&space;be&space;a&space;set&space;of&space;}&space;$n$&space;\textrm{&space;vectors&space;in&space;}&space;$\mathbb{R}^n$." title="\textrm{Let } V \textrm{ be a set of } $n$ \textrm{ vectors in } $\mathbb{R}^n$." /></a>


<a href="https://www.codecogs.com/eqnedit.php?latex=V&space;=&space;\{&space;\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;,&space;\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}&space;,&space;...&space;\begin{pmatrix}v_x\\v_y\\v_z\end{pmatrix}&space;\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?V&space;=&space;\{&space;\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;,&space;\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}&space;,&space;...&space;\begin{pmatrix}v_x\\v_y\\v_z\end{pmatrix}&space;\}" title="V = \{ \begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} , \begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix} , ... \begin{pmatrix}v_x\\v_y\\v_z\end{pmatrix} \}" /></a>

and let the scalars
<a href="https://www.codecogs.com/eqnedit.php?latex=a_1,a_2&space;,&space;...&space;a_n&space;\in&space;\mathbb{R}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?a_1,a_2&space;,&space;...&space;a_n&space;\in&space;\mathbb{R}" title="a_1,a_2 , ... a_n \in \mathbb{R}" /></a>

A **linear combination** of the vectors in $V$ is defined as the following:

<a href="https://www.codecogs.com/eqnedit.php?latex=a_1v_1&space;&plus;&space;a_2v_2&space;&plus;&space;...&space;&plus;&space;a_nv_n" target="_blank"><img src="https://latex.codecogs.com/gif.latex?a_1v_1&space;&plus;&space;a_2v_2&space;&plus;&space;...&space;&plus;&space;a_nv_n" title="a_1v_1 + a_2v_2 + ... + a_nv_n" /></a>
One of the many uses of a linear combination of vectors is **Span**

The **Span** of all the vectors in $V$ is *all* the possible combinations of the scalars. Consider the example:
Let $V$ be the set of vectors:



<a href="https://www.codecogs.com/eqnedit.php?latex=V&space;=&space;\{&space;\begin{pmatrix}&space;1\\0&space;\\&space;0\end{pmatrix}&space;,&space;\begin{pmatrix}&space;0\\1&space;\\&space;0\end{pmatrix}&space;\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?V&space;=&space;\{&space;\begin{pmatrix}&space;1\\0&space;\\&space;0\end{pmatrix}&space;,&space;\begin{pmatrix}&space;0\\1&space;\\&space;0\end{pmatrix}&space;\}" title="V = \{ \begin{pmatrix} 1\\0 \\ 0\end{pmatrix} , \begin{pmatrix} 0\\1 \\ 0\end{pmatrix} \}" /></a>


<a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{the&space;Span}($V$)&space;\textrm{&space;makes&space;up&space;the&space;}&space;$xy$&space;\textrm{&space;plane&space;in&space;}&space;$\mathbb{R}^3$." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{the&space;Span}($V$)&space;\textrm{&space;makes&space;up&space;the&space;}&space;$xy$&space;\textrm{&space;plane&space;in&space;}&space;$\mathbb{R}^3$." title="\textrm{the Span}($V$) \textrm{ makes up the } $xy$ \textrm{ plane in } $\mathbb{R}^3$." /></a>
---

## Matrices

<a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{Vectors&space;can&space;be&space;thought&space;of&space;as&space;}&space;$\mathbb{R}^{n&space;\times&space;1}$&space;\textrm{&space;matrices,&space;and&space;scalars&space;}$\mathbb{R}^{1&space;\times&space;1}$&space;\textrm{&space;matrices.&space;They&space;are&space;special&space;cases&space;of&space;matrices&space;though,&space;as&space;we'll&space;see,&space;some&space;operations&space;are&space;not&space;defined&space;with&space;matrices.&space;}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{Vectors&space;can&space;be&space;thought&space;of&space;as&space;}&space;$\mathbb{R}^{n&space;\times&space;1}$&space;\textrm{&space;matrices,&space;and&space;scalars&space;}$\mathbb{R}^{1&space;\times&space;1}$&space;\textrm{&space;matrices.&space;They&space;are&space;special&space;cases&space;of&space;matrices&space;though,&space;as&space;we'll&space;see,&space;some&space;operations&space;are&space;not&space;defined&space;with&space;matrices.&space;}" title="\textrm{Vectors can be thought of as } $\mathbb{R}^{n \times 1}$ \textrm{ matrices, and scalars }$\mathbb{R}^{1 \times 1}$ \textrm{ matrices. They are special cases of matrices though, as we'll see, some operations are not defined with matrices. }" /></a>



Let $V$ be a set of vectors, 
<a href="https://www.codecogs.com/eqnedit.php?latex=V&space;=&space;\{&space;\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;,&space;\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}&space;,&space;\begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix}&space;\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?V&space;=&space;\{&space;\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;,&space;\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}&space;,&space;\begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix}&space;\}" title="V = \{ \begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} , \begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix} , \begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix} \}" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{&space;Let&space;}&space;$u&space;\in&space;\mathbb{R}^3$&space;\textrm{&space;be&space;defined&space;as&space;a&space;linear&space;combination&space;of&space;the&space;vectors&space;in&space;}&space;$V$." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{&space;Let&space;}&space;$u&space;\in&space;\mathbb{R}^3$&space;\textrm{&space;be&space;defined&space;as&space;a&space;linear&space;combination&space;of&space;the&space;vectors&space;in&space;}&space;$V$." title="\textrm{ Let } $u \in \mathbb{R}^3$ \textrm{ be defined as a linear combination of the vectors in } $V$." /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=u&space;=&space;c_1\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;&plus;&space;c_2\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}&space;&plus;&space;c_3\begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix}&space;=&space;\begin{pmatrix}c_1v_1&space;&plus;&space;c_2v_4&space;&plus;&space;c_3v_7&space;\\&space;c_1v_2&space;&plus;&space;c_2v_5&space;&plus;&space;c_3v_8&space;\\&space;c_1v_3&space;&plus;&space;c_2v_6&space;&plus;&space;c_3v_9\end{pmatrix}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?u&space;=&space;c_1\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix}&space;&plus;&space;c_2\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}&space;&plus;&space;c_3\begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix}&space;=&space;\begin{pmatrix}c_1v_1&space;&plus;&space;c_2v_4&space;&plus;&space;c_3v_7&space;\\&space;c_1v_2&space;&plus;&space;c_2v_5&space;&plus;&space;c_3v_8&space;\\&space;c_1v_3&space;&plus;&space;c_2v_6&space;&plus;&space;c_3v_9\end{pmatrix}" title="u = c_1\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} + c_2\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix} + c_3\begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix} = \begin{pmatrix}c_1v_1 + c_2v_4 + c_3v_7 \\ c_1v_2 + c_2v_5 + c_3v_8 \\ c_1v_3 + c_2v_6 + c_3v_9\end{pmatrix}" /></a>


We can rearrange the linear combination to be a multiplication of a matrix and a vector. 

<a href="https://www.codecogs.com/eqnedit.php?latex=u&space;=&space;\begin{pmatrix}v_1&space;&&space;v_4&space;&&space;v_7\\v_2&v_5&v_8\\v_3&v_6&v_9\end{pmatrix}&space;\begin{pmatrix}c_1&space;\\&space;c_2&space;\\&space;c_3\end{pmatrix}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?u&space;=&space;\begin{pmatrix}v_1&space;&&space;v_4&space;&&space;v_7\\v_2&v_5&v_8\\v_3&v_6&v_9\end{pmatrix}&space;\begin{pmatrix}c_1&space;\\&space;c_2&space;\\&space;c_3\end{pmatrix}" title="u = \begin{pmatrix}v_1 & v_4 & v_7\\v_2&v_5&v_8\\v_3&v_6&v_9\end{pmatrix} \begin{pmatrix}c_1 \\ c_2 \\ c_3\end{pmatrix}" /></a>

That's because matrix multiplication is defined as:

<a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{Let&space;}$A,B$&space;\textrm{&space;be&space;}&space;$\mathbb{R}^{n&space;\times&space;m}$&space;\textrm{&space;matrices.&space;}&space;$$AB_{ij}&space;=&space;\sum_{p&space;=&space;1}&space;A_{jp}&space;*&space;B_{pi}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{Let&space;}$A,B$&space;\textrm{&space;be&space;}&space;$\mathbb{R}^{n&space;\times&space;m}$&space;\textrm{&space;matrices.&space;}&space;$$AB_{ij}&space;=&space;\sum_{p&space;=&space;1}&space;A_{jp}&space;*&space;B_{pi}$$" title="\textrm{Let }$A,B$ \textrm{ be } $\mathbb{R}^{n \times m}$ \textrm{ matrices. } $$AB_{ij} = \sum_{p = 1} A_{jp} * B_{pi}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{Where&space;}&space;$AB_{ij}$&space;\textrm{&space;is&space;the&space;entry&space;in&space;the&space;}&space;$i^{\textrm{th}}$&space;\textrm{&space;row&space;and&space;}&space;$j^{\textrm{th}}$&space;\textrm{&space;column&space;of&space;the&space;product&space;of&space;}&space;$A$&space;\textrm{&space;and&space;}&space;$B$.&space;\textrm{&space;It&space;can&space;also&space;be&space;thought&space;of&space;as&space;the&space;dot&space;product&space;of&space;the&space;}&space;$i^{\textrm{th}}$&space;\textrm{&space;row&space;and&space;the&space;}&space;$j^{\textrm{th}}$&space;\textrm{&space;column.&space;}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{Where&space;}&space;$AB_{ij}$&space;\textrm{&space;is&space;the&space;entry&space;in&space;the&space;}&space;$i^{\textrm{th}}$&space;\textrm{&space;row&space;and&space;}&space;$j^{\textrm{th}}$&space;\textrm{&space;column&space;of&space;the&space;product&space;of&space;}&space;$A$&space;\textrm{&space;and&space;}&space;$B$.&space;\textrm{&space;It&space;can&space;also&space;be&space;thought&space;of&space;as&space;the&space;dot&space;product&space;of&space;the&space;}&space;$i^{\textrm{th}}$&space;\textrm{&space;row&space;and&space;the&space;}&space;$j^{\textrm{th}}$&space;\textrm{&space;column.&space;}" title="\textrm{Where } $AB_{ij}$ \textrm{ is the entry in the } $i^{\textrm{th}}$ \textrm{ row and } $j^{\textrm{th}}$ \textrm{ column of the product of } $A$ \textrm{ and } $B$. \textrm{ It can also be thought of as the dot product of the } $i^{\textrm{th}}$ \textrm{ row and the } $j^{\textrm{th}}$ \textrm{ column. }" /></a>


Seeing how matrix multiplication is defined, we can also see that <a href="https://www.codecogs.com/eqnedit.php?latex=$AB&space;\neq&space;BA$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$AB&space;\neq&space;BA$" title="$AB \neq BA$" /></a>. 



## Where to go now?

If you want to keep learning about linear algebra, here are some **free** resources.


[3Blue1Brown Essence of Linear Algebra Video Series](https://youtu.be/fNk_zzaMoSs)
Great for intuitive explanations and amazing visuals.




[MIT Open Courseware](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/) is a great intro to linear algebra.  Should be very similar to any undergraduate course taken at a college.



*TODO* Add graphics, add linear transformation section. 
