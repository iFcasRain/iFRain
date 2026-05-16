# Leetcode

## 多叉树转二叉树

> 给定一颗多叉树，将其转化为左孩子右兄弟的二叉树形式
>
> 1. 多叉树的输入：给出一棵有n个点的以1为根节点的有根多叉树
>
>    第1行，有根多叉树的节点数n (1<=n<=100,000)
>
>    第2行到第n行，第i行表示i号节点的父亲节点f[i]，(1<=f[i]<i)
>
> 2.转成左儿子右兄弟的二叉树形式，并输出其层次遍历顺序

### 原理

![img](https://img-blog.csdn.net/20170425133206669?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQzIwMTgwNjAyX2NzcQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

- **根节点的第一个孩子保持不变，作为二叉树根节点的左孩子，其余所有的孩子结点与根节点连接断掉**

  <img src="https://img-blog.csdn.net/20170425133535342?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQzIwMTgwNjAyX2NzcQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center" alt="img" style="zoom: 67%;" />

- **将同一层的其余孩子结点从左至右依次连接，挂在第一个孩子的右孩子处**



<img src="https://img-blog.csdn.net/20170425134259345?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQzIwMTgwNjAyX2NzcQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center" alt="img" style="zoom:67%;" />

- **以此类推** 

- <img src="https://img-blog.csdn.net/20170425134652567?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQzIwMTgwNjAyX2NzcQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center" alt="img" style="zoom:67%;" />

   


### 代码实现

```c++
#include <iostream>
#include <vector>
#include <queue>
using namespace std;
typedef struct bitree{
    int left=-1;
    int right=-1;
}bitree;		//利用vector储存每个结点的左右孩子
int main(){
    int n;
    int tree;
    cin>>n;		//输入结点数
    vector<vector<int>> node(n+1);		//创建以vector<int>为基本元素的vector
    node[1].push_back(1);				//第一个结点的值为1
    for(int i=2;i<=n;i++){
        node[i].push_back(i);			//每个vector<int>的第一个元素为递增的序号
        cin>>tree;						//输入每个结点的父节点
        if(tree>=i) continue;			//检查输入的正确性，若父节点大于等于子节点则为无效输入
        node[tree].push_back(i);		//将该结点“挂”到对应父节点的下面
    }									
    //例：输入为：5 1 1 1 2； 即包括根节点有5个结点，第2，3，4的父节点为1，第5的父节点为第2个结点  多叉树为：
    //				1
    //		2		3 		4
   	// 	  5
 	//则经过转化后会有如下形式：
    //  node[0] 	node[1]		node[2]		node[3] 	node[4]		node[5]
    //				   1		    2			3			4			5		
    //				   2			5
    //				   3
    // 				   4
    vector<bitree> Node(n+1);	//创建新的vector来储存每个结点的左右孩子；
    for(int i=1;i<n+1;i++){
        if(node[i].size()==1) continue;	//当node[i]的大小为1时，说明没有以i为父节点的结点；即i结点没有左右孩子
        if(node[i].size()==2){
            Node[i].left=node[i][1];		//当大小为2时，说明第二个元素为唯一的孩子，为左孩子；
        }
        else{
            Node[i].left=node[i][1];
            for(int j=2;j<node[i].size();j++){
                Node[node[i][j-1]].right=node[i][j];    //除了第二个元素以外的元素都是兄弟节点，应该依次挂到左边兄弟的右孩子处
            }
        }
    }
    queue<int> res;		//创建队列实现层序遍历，即从根节点开始输出，输出前将其左右孩子依次入队，直至队空
    res.push(1);
    while(!res.empty(){
        if(Node[res.front()].left!=-1){
            res.push(Node[res.front()].left);
        }
         if(Node[res.front()].right!=-1){
            res.push(Node[res.front()].right);
        }
        cout<<res.front()<<" ";
        res.pop();
    }
    return 0;
}
```

## 并查集的使用-家族查询

> 并查集：用树来表示“集合” 	
>
> 1. 把两个集合合并为一个集合  ： “并”	->让其中一个集合的“根”以另一个集合的“根”为父结点	
> 2.  某元素属于哪个集合 ： ”查“  ->  从指定元素出发找“根” -> “双亲表示法” 
> 3. 某两个元素是否为同一集合：  分别“查”
> 4. 存储结构：int 数组储存每个结点的父节点（-1为根节点）

### 情景导入

对于亲戚关系

①若a,b为亲戚，b,c为亲戚，可知a,c也为亲戚

②若a,b为亲戚，则a的所有亲戚同时为b的亲戚，b的所有亲戚同时为a的亲戚

③输入：

第一行为数据组数T(T <= 20)
对于每组数据，第一行有两个整数n、m(1 <= n, m <= 5000)，表示有n个人，编号1~n，其中存在m个亲戚关系
接下来m行，每行有两个整数u、v(u != v, 1 <= u, v <= n)，表示u和v之间有亲戚关系
然后是询问组数q(1 <= q <= 5000)
接下来q行，每行有两个整数u、v(u != v, 1 <= u, v <= n)，询问u和v之间是否有亲戚关系

④输出：

对于每组数据，输出q行，每行为"Yes"或"No"，表示是否存在亲戚关系
每组数据的输出用空行隔开

### 代码实现

``` c++
#include <iostream>
#include <vector>
using namespace std;
int find(vector<int>& parent,int x){ //实现并查集的“查”操作
    while(parent[x]!=x){	//初始化时，parent[x]=x 此时每个结点为根节点
        x=parent[x];
    }
    return x;			//返回x的根节点序号
}
void unite(vector<int>& parent,int x,int y){	//实现并查集的“并”操作
    if(find(parent,y)!=find(parent,x)		//当两个结点的根节点不同时执行并操作
    parent[find(parent,y)]=find(parent,x);	
}
int main(){
    int T,n,m,x,y;
    cin>>T;		
    for(int i=0;i<T;i++){
        cin>>n>>m;
        vector<int> parent(n+1);
        for(int j=1;j<n+1;j++)	parent[j]=j;//初始化
        for(int k=0;k<m;k++){
            cin>>x>>y;
            unite(parent,x,y);	//不断的对新加入的“亲戚关系”进行“并”操作
        }
        int q;
        cin>>q;
        for(int k=0;k<q;k++){
            cin>>x>>y;
            if(find(parent,x)==find(parent,y) cout<<"Yes"<<endl;
            //当要询问的双方的根节点相同时，意味着二者为亲戚关系（属于并查集的同一集合）
            else cout<<"No"<<endl;
        }
        cout<<endl;
    }
    return 0;
}
```

## 优先队列

