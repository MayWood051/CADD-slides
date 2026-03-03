---
theme: academic
layout: cover
background: 'linear-gradient(to right, #1e3a8a, #3b82f6)'
class: text-white
highlighter: shiki
info: |
  iGEM 2026 CADD Course
  Introduction to Computer-Aided Drug Design
---

# 计算机辅助药物设计
## 从分子对接到动力学模拟

<div class="pt-12">
  <span class="text-2xl opacity-80">
    理解药物如何在原子层面与靶点相互作用
  </span>
</div>

<div class="abs-br m-6 text-xl opacity-80">
  iGEM 2026 · CADD 基础课程
</div>

---
layout: center
---

# 💊 药物研发的现实困境

<div class="grid grid-cols-2 gap-8 mt-8">
<div class="bg-gray-50 p-6 rounded-lg shadow-sm border-l-4 border-orange-500">

### 传统方法的痛点

<v-clicks>

- 📊 **成功率极低**：10,000 个候选化合物 → 仅 1 个上市
- 💰 **成本高昂**：平均 26 亿美元 / 新药
- ⏱️ **周期漫长**：长达 10-15 年的研发时间
- 🎯 **盲目筛选**：高通量筛选如同“大海捞针”

</v-clicks>

</div>

<div class="bg-gray-50 p-6 rounded-lg shadow-sm border-l-4 border-blue-500" v-click>

### CADD 的破局之道

<v-clicks>

- 🔬 **虚拟筛选**：利用计算力前置排雷
- 📉 **降本增效**：将试错成本转移到硅基计算
- ⚡ **周期缩短**：数年缩短至数月
- 🧠 **理性设计**：“按图索骥”替代随机盲试

</v-clicks>

</div>
</div>

<v-click>

<div class="mt-8 p-4 bg-gradient-to-r from-blue-600 to-blue-400 text-white rounded-lg text-center text-xl font-bold shadow-md">
  🎯 核心价值：用计算机预测靶点结合，用理性设计替代盲目试错
</div>

</v-click>

---
layout: section
background: 'linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%)'
---

# 第一章：CADD 全景图
## 绘制药物发现的数字航线

---
layout: default
---

# 🗺️ CADD 的两大核心分类

在计算药物设计中，我们通常面临已知和未知的信息博弈。

<div class="grid grid-cols-2 gap-6 mt-8">

<v-click>
<div class="p-6 border border-blue-200 rounded-lg bg-blue-50/30">
  <div class="text-4xl mb-4 text-blue-600"><carbon:cube /></div>
  <h3 class="text-blue-800 font-bold">基于受体的药物设计 (SBDD)</h3>
  <p class="text-sm text-gray-600 mb-4">Structure-Based Drug Design</p>
  
  - **已知**：靶点（蛋白）的三维结构
  - **策略**：为已知的“锁”打造一把定制的“钥匙”
  - **核心技术**：分子对接、分子动力学
  - <span class="text-orange-600 font-bold">本课程的核心重点</span>
</div>
</v-click>

<v-click>
<div class="p-6 border border-gray-200 rounded-lg bg-gray-50">
  <div class="text-4xl mb-4 text-gray-600"><carbon:chemistry /></div>
  <h3 class="text-gray-800 font-bold">基于配体的药物设计 (LBDD)</h3>
  <p class="text-sm text-gray-600 mb-4">Ligand-Based Drug Design</p>

  - **已知**：一批具有活性的已知药物/化合物
  - **策略**：寻找这些“钥匙”的共同特征（药效团）
  - **核心技术**：定量构效关系 (QSAR)、药效团模型
  - **应用场景**：靶点结构尚未解析时
</div>
</v-click>

</div>

---
layout: default
---

# 🧬 药物作用的本质：从锁钥到手套

药物如何与蛋白结合？这是一个认知不断演进的过程。

<v-clicks>

1. **锁与钥匙模型 (Lock and Key)** 🔒
   - *早期认知*：认为蛋白是刚性的，药物完美契合。
   - *局限*：无法解释蛋白的构象变化。

2. **诱导契合模型 (Induced Fit)** 🧤
   - *现代共识*：药物如同“手”，蛋白如同“手套”。
   - *机制*：药物结合时，蛋白构象会发生**适应性改变**，互相塑造。

3. **热力学驱动 (Thermodynamics)** ⚡
   - *本质规律*：分子结合不是因为“想”结合。
   - *决定因素*：结合后的体系具备更低的**自由能 ($\Delta G$)**，状态更稳定。

</v-clicks>

<v-click>
<div class="mt-6 bg-orange-50 border-l-4 border-orange-500 p-4 rounded text-orange-900">
  💡 <strong>案例启示：</strong> 伊马替尼 (格列卫) 就是通过稳定激酶的一种特定非活性构象（诱导契合）来实现极高选择性的。
</div>
</v-click>

---
layout: section
background: 'linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%)'
---

# 第二章：数据是基础
## Garbage In, Garbage Out (GIGO) 准则

---
layout: two-cols
---

# 🏗️ 受体（蛋白）的预处理

实验解析的结构（如 PDB 文件）充满缺陷，不能直接用于计算！

<v-clicks>

### 常见的结构缺陷：
- 👻 **缺少氢原子**：X-ray 衍射通常看不见氢
- ❓ **质子化状态不明**：His、Glu 等在生理 pH 下带电状态各异
- 💥 **原子重叠 (Clash)**：实验误差导致虚假的极高斥力
- 🕳️ **结构缺失**：柔性 Loop 区经常解析不出

### 预处理标准流程：
1. **去水**：删除非关键溶剂水
2. **补全**：修复缺失残基/侧链
3. **加氢加电荷**：模拟 pH 7.4 生理环境
4. **能量最小化**：微调位置，释放不合理张力

</v-clicks>

::right::

<div class="pl-8 pt-4">

<v-click>

# 🧪 配体（小分子）的陷阱

SMILES 或 2D 结构式**无法表达生物活性构象**。

</v-click>

<v-clicks>

### 维度陷阱：
- 1 个 SMILES $\neq$ 1 个 3D 分子！
- **立体异构**：手性中心 (R/S)、双键顺反 (E/Z)
- **互变异构**：酮式 vs 烯醇式
- **质子化状态**：-COOH 还是 -COO⁻？

### 预处理目标：
- **状态枚举**：生成所有可能的合理状态
- **3D 构象生成**：优化键长、键角，生成低能 3D 构象库

</v-clicks>

</div>

---
layout: default
---

# ⚠️ 常见分子格式防坑指南

<div class="overflow-x-auto text-sm mt-8">
  <table class="w-full text-left border-collapse">
    <thead>
      <tr class="bg-blue-100 text-blue-900">
        <th class="p-3 border">格式</th>
        <th class="p-3 border">示例扩展名</th>
        <th class="p-3 border">对象与用途</th>
        <th class="p-3 border">避坑指南</th>
      </tr>
    </thead>
    <tbody>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold">PDB</td>
        <td class="p-3 border">.pdb</td>
        <td class="p-3 border">蛋白/复合体</td>
        <td class="p-3 border text-red-600">格式已冻结，信息常缺失，极易缺氢！</td>
      </tr>
      <tr class="hover:bg-gray-50 bg-blue-50/30">
        <td class="p-3 border font-bold">PDBx/mmCIF</td>
        <td class="p-3 border">.cif</td>
        <td class="p-3 border">蛋白/复合体</td>
        <td class="p-3 border text-green-600">★ 推荐格式，兼容性好，信息丰富。</td>
      </tr>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold">SMILES</td>
        <td class="p-3 border">.smi</td>
        <td class="p-3 border">小分子 1D 拓扑</td>
        <td class="p-3 border text-orange-600">手性(@)/双键(/)构型不写会丢失关键空间信息。</td>
      </tr>
      <tr class="hover:bg-gray-50 bg-blue-50/30">
        <td class="p-3 border font-bold">SDF</td>
        <td class="p-3 border">.sdf</td>
        <td class="p-3 border">多分子+属性</td>
        <td class="p-3 border">虚拟筛选常用，但不同软件间属性易丢失。</td>
      </tr>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold">MAE</td>
        <td class="p-3 border">.mae/.maegz</td>
        <td class="p-3 border">复合体/多结构</td>
        <td class="p-3 border text-blue-600">Schrödinger 专用，可包含电荷与力场参数。</td>
      </tr>
    </tbody>
  </table>
</div>

<v-click>
<div class="mt-6 text-center text-gray-500 text-sm italic">
  *注：不必死记硬背，核心是了解每种格式携带了哪些维度的信息（1D/2D/3D、电荷、力场参数）。
</div>
</v-click>

---
layout: section
background: 'linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%)'
---

# 第三章：分子对接
## Molecular Docking：寻找第一眼的心动

---
layout: default
---

# 🎯 分子对接的两个核心问题

分子对接本质上是一个**寻找（采样）**和**评价（打分）**的循环过程。

<div class="grid grid-cols-2 gap-8 mt-6">

<div v-click>

### 1. 采样 Algorithm：它在哪里？

无穷尽的空间姿势，计算机如何搜索？

- **自由度控制**：平移、旋转、扭转（Rotatable Bonds）
- **常见策略**：
  - 🎲 **蒙特卡洛 (Monte Carlo)**：随机变异+模拟退火
  - 🧬 **遗传算法 (Genetic)**：编码基因，交叉变异进化 (AutoDock)
  - 🧩 **系统片段法**：打碎分子，像拼积木一样组装 (Glide)

</div>

<div v-click>

### 2. 打分 Function：它结合得紧吗？

找到姿势后，如何量化评价？

$$
\Delta G_{\text{bind}} \approx E_{\text{vdw}} + E_{\text{elec}} + E_{\text{hbond}} + \Delta G_{\text{solv}}
$$

- 🧲 **$E_{\text{vdw}}$**：范德华力（形状互补）
- ⚡ **$E_{\text{elec}}$**：静电作用（电荷互补）
- 🔗 **$E_{\text{hbond}}$**：氢键（特异性关键！）
- 💧 **$\Delta G_{\text{solv}}$**：去溶剂化能（疏水效应驱动）

</div>

</div>

<v-click>
<div class="mt-6 p-4 bg-red-50 border border-red-200 text-red-700 rounded-lg text-center font-bold shadow-sm">
  🚨 警惕：打分函数是经验性的缩放，Docking Score 绝对不等于真实的结合自由能！它主要用于定性排序。
</div>
</v-click>

---
layout: center
---

# ⚖️ 对接类型的权衡与选择

在精度与速度之间寻找平衡。

<v-clicks>

<div class="flex flex-col gap-6 mt-8 w-full max-w-4xl">

<div class="flex items-center gap-4 p-4 border rounded-lg shadow-sm bg-gray-50 opacity-80">
  <div class="w-32 text-center font-bold text-gray-500">刚性对接</div>
  <div class="flex-1">受体、配体均固定。速度极快，精度极低。</div>
  <div class="w-28 text-right"><span class="bg-gray-200 px-3 py-1 rounded text-xs font-mono">已极少使用</span></div>
</div>

<div class="flex items-center gap-4 p-5 border-2 border-blue-400 rounded-lg shadow-md bg-blue-50 transform scale-105 transition-all">
  <div class="w-32 text-center font-bold text-blue-700 text-xl">半柔性对接</div>
  <div class="flex-1 text-lg"><strong>受体刚性，配体柔性</strong>（构象可变）。</div>
  <div class="w-28 text-right"><span class="bg-blue-600 text-white px-3 py-1 rounded text-xs font-bold font-mono">工业界标准</span></div>
</div>

<div class="flex items-center gap-4 p-4 border rounded-lg shadow-sm bg-orange-50">
  <div class="w-32 text-center font-bold text-orange-600">柔性对接</div>
  <div class="flex-1">诱导契合 (IFD)：受体侧链和配体均可动。算力消耗巨大。</div>
  <div class="w-28 text-right"><span class="bg-orange-200 px-3 py-1 rounded text-xs font-mono text-orange-800">精细机制研究</span></div>
</div>

</div>

</v-clicks>

---
layout: section
background: 'linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%)'
---

# 第四章：分子动力学 (MD)
## Molecular Dynamics：从静态照片到动态电影

---
layout: default
---

# 🎬 为什么有了对接，还需要 MD？

对接提供的是瞬间的“快照”，而生命系统是时时刻刻在运动的。

<v-clicks>

- ⏱️ **时间维度缺失**：对接看不到蛋白的“呼吸”运动和构象振动。
- 🌪️ **假阳性剔除**：对接第一名的姿势，可能在真实热运动中只需 1ns 就飞出口袋（不稳定）。
- 💧 **显式溶剂效应**：对接常用隐式水；MD 引入真实水分子，能发现关键的水桥 (Water Bridge) 作用。
- 🔬 **精确能量计算**：通过 MD 轨迹提取构象，可进行高精度自由能计算 (MM-GBSA, FEP)。

</v-clicks>

<v-click>
<div class="mt-8 bg-blue-50 p-6 rounded-lg border border-blue-200 shadow-sm">
  <div class="text-xl mb-3 font-bold text-blue-800 flex items-center gap-2"><carbon:function-math /> MD 的物理核心：牛顿第二定律 ($F = ma$)</div>
  <p class="text-sm text-gray-700">利用**力场 (Force Field)** 描述原子间的相互作用力，以极小的步长 (2 飞秒, $2 \times 10^{-15} s$) 循环计算：</p>
  <div class="mt-4 flex items-center justify-center gap-4 font-mono text-blue-600 bg-white p-3 rounded border border-blue-100">
    计算受力 → 算加速度 → 更新速度 → 更新位置 → 时间前进
  </div>
  <p class="text-xs text-center mt-3 text-red-500 font-bold">注：模拟 100 纳秒需迭代计算 5000 万次，严重依赖高性能 GPU 算力。</p>
</div>
</v-click>

---
layout: two-cols
---

# ⚙️ MD 模拟标准流程

<div class="mt-6 pr-6">

<v-clicks>

1. **系统构建 (System Builder)**
   - 复合物装入水盒子
   - 添加离子中和电荷 (Na⁺/Cl⁻)
2. **能量最小化 (Minimization)**
   - 消除系统碰撞张力
3. **预平衡 (Equilibration)**
   - **NVT** (等容等温)：逐渐加热至 310K
   - **NPT** (等压等温)：加压至 1 atm，压实水盒子
4. **成品模拟 (Production)**
   - 解除束缚，自由演化收集轨迹

</v-clicks>

</div>

::right::

<div class="pl-6 mt-6 border-l border-gray-200">

<v-click>

# 📊 核心分析指标

</v-click>

<v-clicks>

- **RMSD (均方根偏差)**
  - 测稳定：整体偏移度
  - 📈 *曲线飙升*：配体跑路或蛋白散架
  - 📉 *曲线平稳*：系统达到稳定态

- **RMSF (均方根涨落)**
  - 测柔性：针对单个残基
  - 🌊 *波峰*：柔性 Loop 区
  - ⚓ *波谷*：刚性核心或结合位点

- **氢键占有率 (Occupancy)**
  - 如果一个氢键在 100ns 中只有 5% 存在，那它对结合贡献甚微。

</v-clicks>

</div>

---
layout: fact
background: 'linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%)'
---

# 总结：从理论到实践
## 从初筛到精算，步步为营

---
layout: default
---

# ⚖️ 技术对比全景图

如何组合使用工具，是 CADD 工程能力的核心体现。

<div class="mt-6">
  <table class="w-full text-left border-collapse border border-gray-200 rounded-lg overflow-hidden">
    <thead>
      <tr class="bg-blue-600 text-white">
        <th class="p-3 border border-blue-700">对比维度</th>
        <th class="p-3 border border-blue-700">分子对接 (Docking)</th>
        <th class="p-3 border border-blue-700">分子动力学 (MD)</th>
      </tr>
    </thead>
    <tbody>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold bg-gray-100">核心本质</td>
        <td class="p-3 border text-orange-600">静态快照 (Snapshot)</td>
        <td class="p-3 border text-blue-600">动态电影 (Movie)</td>
      </tr>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold bg-gray-100">受体状态</td>
        <td class="p-3 border">通常刚性 (Rigid)</td>
        <td class="p-3 border font-bold text-green-600">全系统柔性 (Flexible)</td>
      </tr>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold bg-gray-100">溶剂环境</td>
        <td class="p-3 border">多为隐式溶剂/无溶剂</td>
        <td class="p-3 border">显式水盒子，含水分子互作</td>
      </tr>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold bg-gray-100">计算耗时</td>
        <td class="p-3 border text-green-600 font-bold">极快 (几秒~几分钟/分子)</td>
        <td class="p-3 border text-red-600 font-bold">极慢 (几小时~几天/分子)</td>
      </tr>
      <tr class="hover:bg-gray-50">
        <td class="p-3 border font-bold bg-gray-100">典型场景</td>
        <td class="p-3 border font-bold">高通量虚拟筛选，缩小范围</td>
        <td class="p-3 border font-bold">机制验证，精算结合自由能</td>
      </tr>
    </tbody>
  </table>
</div>

<v-click>
<div class="mt-8 text-center text-lg bg-gradient-to-r from-blue-50 to-indigo-50 py-4 rounded-lg text-blue-900 border-l-4 border-blue-500 font-bold shadow-sm">
  🏆 黄金工作流：受体配体精细预处理 ➔ 高通量 Docking 筛选 Top 100 ➔ MD 验证 Top 10
</div>
</v-click>

---
layout: center
---

# 🌟 结语

CADD 既是 **显微镜**，让我们洞悉原子级别的结合奥秘；
也是 **望远镜**，帮我们在浩瀚化学空间中定位希望。

<v-click>

<div class="mt-8 text-center text-xl text-gray-700 leading-relaxed bg-gray-50 p-8 rounded-xl shadow-inner">
  希望通过这门课，大家不再把药物看作纸面上干瘪的结构式，<br>
  而是看作在三维空间中 <span class="text-blue-600 font-bold">跳动、呼吸、相互拥抱</span> 的实体生命分子。
</div>

</v-click>

<v-click>

<div class="mt-12 text-center">
  <div class="text-4xl font-black bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-indigo-600 mb-2">Thank You</div>
  <div class="text-gray-500 tracking-widest uppercase text-sm mt-4">iGEM 2026 CADD Course</div>
</div>

</v-click>
