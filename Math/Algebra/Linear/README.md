
<script src="//yihui.org/js/math-code.js"></script>
<!-- Just one possible MathJax CDN below. You may use others. -->
<script async
  src="//mathjax.rstudio.com/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>



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

$$ v \in \mathbb{R}^3 ,  v=\begin{pmatrix}
v_1\\
v_2\\
v_3
\end{pmatrix}$$

### Vectors have a few defined operations
- Addition
- Scalar Multiplication

Addition is defined entry wise:

$$v,w \in \mathbb{R}^3 , v+w=\begin{pmatrix}
v_1\\
v_2\\
v_3
\end{pmatrix} + 
\begin{pmatrix}
w_1\\
w_2\\
w_3
\end{pmatrix} = 
\begin{pmatrix}
v_1 + w_1\\
v_2 + w_2\\
v_3 + w_3
\end{pmatrix} 
$$


And scalar multiplication is defined as:
$$c \in \mathbb{R} , cv = c\begin{pmatrix}
v_1\\
v_2\\
v_3
\end{pmatrix} =
\begin{pmatrix}
cv_1\\
cv_2\\
cv_3
\end{pmatrix} 
$$

### Linear Combinations

Let $V$ be a set of $n$ vectors in $\mathbb{R}^n$. 

$$ V = \{ \begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} , \begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix} , ...  \begin{pmatrix}v_x\\v_y\\v_z\end{pmatrix} \}$$

and let the scalars
$$a_1,a_2 , ... a_n \in \mathbb{R}$$

A **linear combination** of the vectors in $V$ is defined as the following:

$$ a_1v_1 + a_2v_2 + ... + a_nv_n$$

One of the many uses of a linear combination of vectors is **Span**

The **Span** of all the vectors in $V$ is *all* the possible combinations of the scalars. Consider the example:
Let $V$ be the set of vectors:
$$V = \{ \begin{pmatrix} 1\\0 \\ 0\end{pmatrix} , \begin{pmatrix} 0\\1 \\ 0\end{pmatrix} \}$$

the Span($V$) makes up the $xy$ plane in $\mathbb{R}^3$.                       

---

## Matrices

Vectors can be thought of as $\mathbb{R}^{n \times 1}$ matrices, and scalars $\mathbb{R}^{1 \times 1}$ matrices. They are special cases of matrices though, as we'll see, some operations are not defined with matrices.  

Let $V$ be a set of vectors, 
$$ V = \{ \begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} , \begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix} ,  \begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix} \}$$

Let $u \in \mathbb{R}^3$ be defined as a linear combination of the vectors in $V$. 

$$ u = c_1\begin{pmatrix}v_1\\v_2\\v_3\end{pmatrix} +  c_2\begin{pmatrix}v_4\\v_5\\v_6\end{pmatrix}   + c_3\begin{pmatrix}v_7\\v_8\\v_9\end{pmatrix} = 
\begin{pmatrix}c_1v_1 + c_2v_4 + c_3v_7 \\ c_1v_2 + c_2v_5 + c_3v_8 \\ c_1v_3 + c_2v_6 + c_3v_9\end{pmatrix}
$$

We can rearrange the linear combination to be a multiplication of a matrix and a vector. 

$$u = \begin{pmatrix}v_1  & v_4 & v_7\\v_2&v_5&v_8\\v_3&v_6&v_9\end{pmatrix} 
\begin{pmatrix}c_1 \\ c_2 \\ c_3\end{pmatrix}$$

That's because matrix multiplication is defined as:
Let $A,B$ be $\mathbb{R}^{n \times m}$ matrices. 
$$AB_{ij} = \sum_{p = 1} A_{jp} * B_{pi}$$

Where $AB_{ij}$ is the entry in the $i^{\textrm{th}}$ row and $j^{\textrm{th}}$ column of the product of $A$ and $B$.
It can also be thought of as the dot product of the $i^{\textrm{th}}$ row and the $j^{\textrm{th}}$ column. 

Seeing how matrix multiplication is defined, we can also see that $AB \neq BA$. 



## Where to go now?

If you want to keep learning about linear algebra, here are some **free** resources.

3Blue1Brown's "Essence of" playlist: https://youtu.be/fNk_zzaMoSs
Great for intuitive explanations and amazing visuals.


MIT course: https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/
Great intro to linear algebra. Should be very similar to any undergraduate course taken at a college.



*TODO* Add graphics, add linear transformation section. 