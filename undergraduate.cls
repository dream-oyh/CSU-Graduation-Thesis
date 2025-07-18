%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 预定义名称
%
% 预定义全局使用的文字，如姓名、专业等信息，
% 在content/info.tex中定义
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下定义封面相关命令和相应的宏，以titleen为例，\titleen为实际在源码中使用的命令，
% 一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏，而该宏能够在后续的环境中使用。
% TODO: 之后版本迁移至公共模板入口csuthesis.cls 处（放置在引入子模版之后）
\newcommand*{\titlecn}[1]{\gdef\@titlecn{#1}}                           % 中文标题
\newcommand*{\titleen}[1]{\gdef\@titleen{#1}}                           % 英文标题
\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}}                     % 一级学科（学科专业）
\newcommand*{\minormajor}[1]{\gdef\@minormajor{#1}}                     % 二级学科（学科方向）
\newcommand*{\interestmajor}[1]{\gdef\@interestmajor{#1}}               % 研究方向，关键词组
\newcommand*{\department}[1]{\gdef\@department{#1}}                     % 二级培养单位
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}                     % 导师
\newcommand*{\myclass}[1]{\gdef\@myclass{#1}}                           % 导师
\newcommand*{\subsupervisor}[1]{\gdef\@subsupervisor{#1}}               % 副导师
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}                       % 学号

\newcommand*{\clcnumber}[1]{\gdef\@clcnumber{#1}}                       % 中图分类号 Chinese Library Classification
\newcommand*{\schoolcode}[1]{\gdef\@schoolcode{#1}}                     % 学校代码
\newcommand*{\udc}[1]{\gdef\@udc{#1}}                                   % UDC
\newcommand*{\academiccategory}[1]{\gdef\@academiccategory{#1}}         % 学术类别

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页面布局
%
% 设置页边距以及版芯行间距设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 边距要求上2.5cm，下2.5cm，左3cm，右2cm
\geometry{top=2.5cm,bottom=2.5cm,left=3cm,right=2cm}
% 本科生从摘要开始就要有
% 设置页眉和页脚 %
\pagestyle{fancy}
% 本科学位论文底部样式
\newcommand{\csu@thepage@format@zh}[2]{第~{#1}~页 共~{#2}~页}
\newcommand{\csu@thepage@format@en}[1]{#1}
% 空白页清空页眉页脚
\patchcmd{\cleardoublepage}{\newpage}{\thispagestyle{empty}\newpage}{}{}
% 对章节首页的特殊page style清除页眉页脚
\patchcmd{\chapter}{\thispagestyle}{\@gobble}{}{}
% 内芯页眉设置
\ifcsu@output@print
    \fancyhead[L]{\includegraphics[scale=0.13]{images/csu_logo_long_black.png}}
\else
    \fancyhead[L]{\includegraphics[scale=0.13]{images/csu_logo_long_blue.png}}
\fi
\ifcsu@type@bachelor
    \fancyhf[RH]{\heiti \zihao{-5} {\@titlecn}}
\else
    \ifcsu@type@translation
        \fancyhf[RH]{\heiti \zihao{-5} {文献翻译}}
    \fi
    \ifcsu@type@research
        \fancyhf[RH]{\heiti \zihao{-5} {调研报告}}
    \fi
\fi

% frontmatter设置
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse
    % 根据学校要求使用大罗马编号
    \pagenumbering{Roman}
    \def\csu@thepage{\thepage}
    \def\csu@lastpageref{\pageref{LastPage}}
    \fancyfoot[C]{\zihao{-5}  \csu@thepage@format@en{\csu@thepage}}
}
% mainmatter设置
\renewcommand{\mainmatter}{
    \cleardoublepage
    \@mainmattertrue
    % 正文部分启用阿拉伯数字编号
    \pagenumbering{arabic}
    \def\csu@thepage{\thepage}
    \def\csu@lastpageref{\pageref{LastPage}}
    \fancyfoot[C]{\zihao{-5} \songti \csu@thepage@format@zh{\csu@thepage}{\csu@lastpageref}}
}
% 给页眉留足空间（否则会有 \headheight is too small的warning）
\setlength{\headheight}{14.5pt}
% “磅”是衡量印刷字体大小的单位,约等于七十二分之一英寸。
% 而 1英寸＝25.4毫米，则1磅＝25.4/72≈0.353毫米。
% 磅和 LaTeX的 pt- points (大约 1/72 inch) 是一致的。
% 基本行间距设置
\renewcommand*{\baselinestretch}{1.5}   % 几倍行间距
\setlength{\baselineskip}{22pt}         % 基准行间距
% \setlength{\bibsep}{0.5ex} % 参考文献条目间距



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 字体设置
%
% 进行相关字体设置，定义必须的新字体
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: Times New Roman目前只能在Windows上使用，需要增加Linux系统字体

% \renewcommand\normalsize{%
% 	\@setfontsize\normalsize{12.05}{14.45}%
% 	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
% 	\abovedisplayshortskip \z@ \@plus3\p@
%     \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
% }

% % Windows 设置
\setCJKmainfont{simsun.ttc}[Path=fonts/, AutoFakeBold, AutoFakeSlant]
\setCJKsansfont{simhei.ttf}[Path=fonts/, AutoFakeBold, AutoFakeSlant]
\setCJKmonofont{simfang.ttf}[Path=fonts/, AutoFakeBold, AutoFakeSlant]

% % % 协议页的标题按模板是华文新魏
% % % Fix: 合并为 newCJKfontfamily
\newCJKfontfamily[hwxw]\hwxw{stxinwei.ttf}[Path=fonts/, BoldFont=*, ItalicFont=*, BoldItalicFont=*]
\newCJKfontfamily[zysong]\songti{simsun.ttc}[Path=fonts/, BoldFont=*, ItalicFont=*, BoldItalicFont=*]
\newCJKfontfamily[zyhei]\heiti{simhei.ttf}[Path=fonts/, BoldFont=*, ItalicFont=*, BoldItalicFont=*]
\newCJKfontfamily[zykai]\kaiti{simkai.ttf}[Path=fonts/, BoldFont=*, ItalicFont=*, BoldItalicFont=*]
\newCJKfontfamily[kaitigb]\kgb{KaiTi_GB2312.ttf}[Path=fonts/, BoldFont=*, ItalicFont=*, BoldItalicFont=*]
% \newfontfamily{\enheiti}{SimHei} % 解决标题英文括号不显示黑体

% % 设置字体路径
% \defaultfontfeatures{Path=fonts/}

% % 设置中文字体
% \setCJKmainfont[
%   BoldFont      = simhei.ttf,
%   ItalicFont    = simkai.ttf
% ]{simsun.ttc}
% \setCJKsansfont{simhei.ttf}
% \setCJKmonofont{simfang.ttf}
% \setCJKfamilyfont{zhsong}{simsun.ttc}
% \setCJKfamilyfont{zhhei}{simhei.ttf}
% \setCJKfamilyfont{zhkai}{simkai.ttf}
% \setCJKfamilyfont{zhfs}{simfang.ttf}

% \newcommand*{\songti}{\CJKfamily{zhsong}}
% \newcommand*{\heiti}{\CJKfamily{zhhei}}
% \newcommand*{\kaiti}{\CJKfamily{zhkai}}
% \newcommand*{\fangsong}{\CJKfamily{zhfs}}

\newfontfamily{\enheiti}[Path=fonts/]{simhei.ttf} % 解决标题英文括号不显示黑体

% 预定义名称
\newcommand*{\csu@name@cover}{扉页}
\newcommand*{\csu@name@abstract@zh}{中文摘要}
\newcommand*{\csu@name@abstract@en}{英文摘要}
\newcommand*{\csu@name@keywords}{关键字}
\newcommand*{\csu@name@contents}{目录}
\newcommand*{\csu@name@listfigure}{插图清单}
\newcommand*{\csu@name@listtable}{附表清单}
\newcommand*{\csu@name@index}{索引}
\newcommand*{\csu@name@figure}{图}
\newcommand*{\csu@name@table}{表}
\newcommand*{\csu@name@appendix}{附录}
\newcommand*{\csu@name@acknowledgements}{致谢}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 封面扉页
%
% 提供本科毕业论文封面扉页设计
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 论文日期
% 采用key-value对的方式来制定存储信息的pgf路径
\pgfkeys{/thesisdate/pgf/.cd, % 定义pgf路径
    year/.store in = \year, % 指定关键词year的存储位置为\year
    month/.store in = \month % 指定关键词month的存储位置为\month
}
% 利用上述的pgf的key-value定制论文日期命令
\newcommand{\thesisdate}[1] {
    \pgfkeys{/thesisdate/pgf/.cd,#1} % 指定使用/thesisdate/pgf/.cd来解释参数，然后在后文能直接使用存储位置来指定解释的内容
    \gdef\@thesisdate{\year{} 年 \month{} 月} % 将构建好的日期存储到宏（\@thesisdate）中
}
% 重定义\maketitle实现封面（扉页）绘制
\RenewDocumentCommand{\maketitle}{}{
    \csu@pdfbookmark{0}{\csu@name@cover}
    % 根据选项进行不同的封面（扉页绘制）
    \ifcsu@type@bachelor
        % 绘制本科毕设论文封面
        \csu@make@bachelor@cover@zh
    \else
        % 绘制论文翻译或者课程论文封面
        \ifcsu@type@translation
            \csu@make@translation@cover@zh
        \fi
        \ifcsu@type@research
            \csu@make@research@cover@zh
        \fi
        % 否则不绘制封面
    \fi
}

% 构建本科毕设论文封面绘制宏
\NewDocumentCommand{\csu@make@bachelor@cover@zh}{} {
    \thispagestyle{empty}
    \begin{center}
        \vspace*{10pt}
        \begin{figure}[hbt]
            \centering
            \ifcsu@output@print
                \includegraphics[width=0.71\textwidth]{images/csu_logo_black.png}
            \else
                \includegraphics[width=0.71\textwidth]{images/csu_logo_long_blue.png}
            \fi
        \end{figure}
        \vspace{8pt}
        \begingroup
            \fontsize{45}{60}\selectfont \enheiti \heiti \CJKsetecglue{} 本科毕业设计(论文) \par
            % 本科毕业设计(论文) \par
            % 45磅，黑体
        \endgroup
        \vspace*{14pt}
        \begingroup
            \zihao{1} \enheiti GRADUATION DESIGN(THESIS) \par
            % 1号，黑体
        \endgroup
        \vspace{70pt} % 空行
        \begingroup
            \linespread{1.3}
            \zihao{-2} 
            \heiti
            \begin{tabular}{ll}
                \hspace{12pt} \makebox[4em][s]{题\qquad 目：} & \underline{\parbox[][][c]{220pt}{\center \kaiti \@titlecn}} \\
                \hspace{12pt} \makebox[4em][s]{学生姓名：} & \underline{\makebox[220pt][c]{\kaiti \@author}} \\
                \hspace{12pt} \makebox[4em][s]{指导老师：} &  \underline{\makebox[220pt][c]{\kaiti \@supervisor}}  \\
                \hspace{12pt} \makebox[4em][s]{学\qquad 院：} & \underline{\makebox[220pt][c]{\kaiti \@department}}  \\
                \hspace{12pt} \makebox[4em][s]{专业班级：} & \underline{\makebox[220pt][c]{\kaiti \@myclass}}  \\
            \end{tabular}
        \endgroup
        \par
        \vspace{40pt}
        % \vfill
        \begingroup
            {\zihao{2} \heiti 本科生院制 \par}
            \vspace{10pt}
            {\zihao{-2} \heiti \@thesisdate \par}
        \endgroup
    \end{center}
}
% 构建论文翻译封面绘制宏
\NewDocumentCommand{\csu@make@translation@cover@zh}{} {
    \thispagestyle{empty}
    \begin{center}
        \vspace*{10pt}
        \begin{figure}[hbt]
            \centering
            \ifcsu@output@print
                \includegraphics[width=0.71\textwidth]{images/csu_logo_long_black.png}
            \else
                \includegraphics[width=0.71\textwidth]{images/csu_logo_long_blue.png}
            \fi
        \end{figure}
        \vspace{8pt}
        \begingroup
           \linespread{1.0}
           \fontsize{45}{60}\selectfont \enheiti \heiti \CJKsetecglue{} 本科毕业设计(论文) \par 
           \fontsize{40}{45}\selectfont \enheiti \heiti \CJKsetecglue{}文献翻译 \par
        \endgroup
        \vspace*{14pt}
        \begingroup
            \linespread{1.0}
            \zihao{1} \enheiti GRADUATION DESIGN(THESIS) \par
            \zihao{1} \enheiti TRANSLATION \par
            % 1号，黑体
        \endgroup
        \vspace{40pt} % 空行
        \begingroup
            \linespread{1.3}
            \zihao{-2} 
            \heiti
            \begin{tabular}{ll}
                \hspace{12pt} \makebox[4em][s]{题\qquad 目：} & \underline{\parbox[][][c]{220pt}{\center \kaiti \@titlecn}} \\
                \hspace{12pt} \makebox[4em][s]{学生姓名：} & \underline{\makebox[220pt][c]{\kaiti \@author}} \\
                \hspace{12pt} \makebox[4em][s]{指导老师：} &  \underline{\makebox[220pt][c]{\kaiti \@supervisor}}  \\
                \hspace{12pt} \makebox[4em][s]{学\qquad 院：} & \underline{\makebox[220pt][c]{\kaiti \@department}}  \\
                \hspace{12pt} \makebox[4em][s]{专业班级：} & \underline{\makebox[220pt][c]{\kaiti \@myclass}}  \\
            \end{tabular}
        \endgroup
        \par
        \vspace{40pt}
        % \vfill
        \begingroup
            {\zihao{2} \heiti 本科生院制 \par}
            \vspace{10pt}
            {\zihao{-2} \heiti \@thesisdate \par}
        \endgroup
    \end{center}
}
% 构建调研报告封面绘制宏
\NewDocumentCommand{\csu@make@research@cover@zh}{} {
    \thispagestyle{empty}
    \begin{center}
        \vspace*{10pt}
        \begin{figure}[hbt]
            \centering
            \ifcsu@output@print
                \includegraphics[width=0.71\textwidth]{images/csu_logo_long_black.png}
            \else
                \includegraphics[width=0.71\textwidth]{images/csu_logo_long_blue.png}
            \fi
        \end{figure}
        \vspace{8pt}
    \begingroup
        \linespread{1.0}
        \fontsize{45}{60}\selectfont \enheiti \heiti \CJKsetecglue{} 本科毕业设计(论文) \par 
        \fontsize{40}{45}\selectfont \enheiti \heiti \CJKsetecglue{} 调研报告 \par
     \endgroup
     \vspace*{14pt}
     \begingroup
         \linespread{1.0}
         \zihao{1} \enheiti GRADUATION DESIGN(THESIS) \par
         \zihao{1} \enheiti RESEARCH REPORT \par
         % 1号，黑体
     \endgroup
        \vspace{40pt} % 空行
        \begingroup
            \linespread{1.3}
            \zihao{-2} 
            \heiti
            \begin{tabular}{ll}
                \hspace{12pt} \makebox[4em][s]{题\qquad 目：} & \underline{\parbox[][][c]{220pt}{\center \kaiti \@titlecn}} \\
                \hspace{12pt} \makebox[4em][s]{学生姓名：} & \underline{\makebox[220pt][c]{\kaiti \@author}} \\
                \hspace{12pt} \makebox[4em][s]{指导老师：} &  \underline{\makebox[220pt][c]{\kaiti \@supervisor}}  \\
                \hspace{12pt} \makebox[4em][s]{学\qquad 院：} & \underline{\makebox[220pt][c]{\kaiti \@department}}  \\
                \hspace{12pt} \makebox[4em][s]{专业班级：} & \underline{\makebox[220pt][c]{\kaiti \@myclass}}  \\
            \end{tabular}
        \endgroup
        \par
        \vspace{40pt}
        % \vfill
        \begingroup
            {\zihao{2} \heiti 本科生院制 \par}
            \vspace{10pt}
            {\zihao{-2} \heiti \@thesisdate \par}
        \endgroup
    \end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 摘要
% 
% 提供中英文摘要样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------------------------------
% 中文摘要
% ----------------------------------------------
% 中文摘要格式具体见样例8，居中打印论文题名（三号黑体）
% 换行顶格编排“摘要”（四号黑体）及摘要内容（四号宋体）、
% 每段开头空二格。摘要内容后下换行顶格编排“关键词”和“分类号”（四号黑体）。
% 每篇论文应选取3-8个关键词，每一关键词之间用分号分开，最后一个关键词后不打标点符号。
\newcommand*{\keywordscn}[1]{\gdef\@keywordscn{#1}} % 定义中文关键词
%\newcommand*{\categorycn}[1]{\gdef\@categorycn{#1}} % 定义中文分类
% 定义中文摘要环境
\newenvironment{abstractzh} {
    \csu@pdfbookmark{0}{\csu@name@abstract@zh}
	\renewcommand*{\headsep}{0pt}
	\vspace*{0pt}
    \begin{center} \zihao{-2} \heiti \@titlecn \end{center}
    \vspace{0pt}
    \begin{center} \zihao{3} \heiti 摘要 \end{center}  % 摘要为三号黑体
    \vspace{12pt}
    \linespread{1.5}
    \zihao{-4}\songti  % 内容为四号宋体
}
% 显示中文关键词和分类号
{
    \begin{flushleft}
        \noindent {\zihao{-4} \songti \textbf{关键词}：} {\zihao{-4} \songti \@keywordscn} \par % 关键词为小四号宋体加粗，内容为小四号宋体
    \end{flushleft}
}

% ----------------------------------------------
% 英文摘要
% ----------------------------------------------
% 英文摘要格式和内容与中文摘要相对应，另起一页，具体见样例9。居中打印论文英文题名（三号Times New Roman字体），换行顶格编排“Abstract”及英文摘要内容（四号Times New Roman字体），摘要内容每段开头留四个字符空格。摘要内容后下换行顶格编排“Keywords”和“Classification”。
% 定义英文摘要，字体全部为timesnewroman
\newcommand*{\keywordsen}[1]{\gdef\@keywordsen{#1}} % 英文关键词

\newenvironment{abstracten} { % 新建英文摘要环境
    \csu@pdfbookmark{0}{\csu@name@abstract@en}
    \vspace*{0pt}
    \begin{center} \zihao{-2} \bfseries \@titleen \end{center}

    \begin{center} \zihao{3} \bfseries ABSTRACT \end{center}
    \vspace{12pt}
    \linespread{1.5}
    \zihao{-4} % 内容为四号宋体
}
{
    \begin{flushleft}
        % bugfix 英文摘要字体设置
        \noindent {\zihao{-4} \bfseries \textbf{Key\ words:}~} {\zihao{-4} \@keywordsen} \par % 新版本要求小四号
    \end{flushleft}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. 目录 %
% -----------------------------------------------%
% 目录应列出论文的大标题、一级和二级节标题，逐项标明页码（具体见样例10）。各级标题应简明扼要、点出各部分主要内容。学位论文的页码编排为：正文和后置部分用阿拉伯数字编连续码，前置部分用罗马数字单独编连续码（封面除外）。
% “目录”两字居中（三号黑体），下空两行为章、节、小节及其开始页码（靠右顶格）。章、节、小节分别以阶梯式排列：1（第1章）、1.1、1.1.1依次标出。章、节、小节的题名与页码之间用“．．．．．．”连接。除“目录”两字外，其余字体均为小四号宋体。

%TODO: 本科和硕博目录格式要求不同
% \renewcommand{\contentsname}{\hfill \heiti \zihao{3} 目\quad 录\hfill}
% \renewcommand{\contentsname}{目录}
% 	\renewcommand*{\baselinestretch}{1.5}   % 行间距
%     \tableofcontents
% }
\renewcommand\tableofcontents{
    \chapter*{\csu@name@contents}
    \csu@pdfbookmark{0}{\csu@name@contents}
    \@starttoc{toc}
}
\newcommand\csu@toc@set@format{
    % 目录格式修复
    % bugfix: 修复章节加粗
    \renewcommand\cftchapfont{\songti\zihao{-4}}
    \renewcommand\cftchappagefont{\songti\zihao{-4}}
    \renewcommand{\cftdot}{$\cdot$}
    \renewcommand{\cftdotsep}{0.5}
    \setlength{\cftbeforechapskip}{4pt}
    \setlength{\cftbeforesecskip}{4pt}
    \setlength{\cftbeforesubsecskip}{4pt}
    % \setlength{\cftaftersecskip}{12pt}
    \renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
    \renewcommand{\cftchapdotsep}{\cftdotsep}
}


% 6. 符号说明（必要时）%
% ---------------------------------------------------------%
% TODO:
%
% 如果论文中使用了大量的物理量符号、标志、缩略词、专门计量单位、自定义名词和术语等，应编写成注释说明汇集表，说明论文中所用符号所表示的意义及单位（或量纲）。若上述符号和缩略词使用数量不多，可以不设专门的注释说明汇集表，仅在论文中出现时加以说明。
% “符号说明”四字居中（三号黑体）。


% 7. 论文正文 %
% -------------------------------------------------------%
% 论文正文是主体，主体部分应从另页右页开始，每一章应另起页。一般由序号标题、文字叙述、图、表格和公式等五个部分构成。
% 写作形式可因研究内容的性质不同而变化，一般可包括绪论（或综述）、理论分析、计算方法、实验装置和测试方法、实验结果分析和讨论、研究成果、结论及意义等。
% 该部分由用户编写

% 图表等浮动环境设置 %
% ----------------------------------------------------------%
% TODO %
% 图、表、公式：文中的图、表、附注、公式一律采用阿拉伯数字分章（或连续）编号，如：图2-5，表3-2，公式（5-1）等。
% 图序及图名居中置于图的下方，如果图中含有几个不同部分，应将分图号标注在分图的左上角，并在图解下列出各部分内容。图中的术语、符号、单位等应与正文表述所用一致。
% 表序及表名置于表的上方，表中参数应标明量和单位的符号。表的编排应采用国际通用的三线表。续表均应重复表头，如表需转页接排，随后各页应重复表的编号，其后跟表题（可省略）和“续”置于表上方。
% 图序及图名、表序及表名采用五号楷体字。若图或表中有附注，采用英文小写字母顺序编号，附注写在图或表的下方。公式的编号用括号括起写在右边行末，其间不加虚线。
% 图、表、公式等与正文之间要有一定的行间距。
% \RequirePackage{caption}
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.tif}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}




% 插图格式
% ------------------------------------------------------%
% \captionsetup[subfigure]{labelfont=normalfont,textfont=normalfont,singlelinecheck=off,justification=raggedright}
% singlelinecheck=off 表示即使caption只有一行， justification 也生效
% justification=raggedright 使子图 caption 靠左对齐，而caption的上下位置由\caption标签的位置决定，以此实现了学校要求的子图标签在左上角显示。
% 这部分功能由 subcaption 这个包实现，而这个包不能和 subfigure 同时使用，所以子图的写法也与 subfigure 包的不大一样。
\captionsetup[subfigure]{singlelinecheck=off,justification=raggedright}

% 图下方描述的黑体
\DeclareCaptionFont{hei}{\heiti}
\DeclareCaptionFont{five}{\zihao{5}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
% \renewcommand{\thefigure} {\thesection-\arabic{figure}}

\captionsetup[figure]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={hei,five},
	position=bottom    % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 表格格式
% ------------------------------------------------------%
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
% \renewcommand {\thetable} {\thesection-\arabic{table}}
\captionsetup[table]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={hei,five},   % 表的字体, 宋体小四
	position=top
}



% 列表环境设置 %
% ------------------------------------------------------------------%
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 表格 %
% ------------------------------------------------------%
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\csu@oldtabular\tabular
\let\csu@endoldtabular\endtabular
\renewenvironment{tabular} {
    \bgroup
	\renewcommand{\arraystretch}{1.38}
    \csu@oldtabular
} {
    \csu@endoldtabular\egroup
}

% 表格字号应比正文小，一般五号/10.5pt，但是暂时没法再cls里设置（不然会影响到封面等tabular环境）
% 所以目前只好在主文件里局部\AtBeginEnvironment

% 数学环境, 定理等设置 %
% -------------------------------------------------------%
\newtheorem{definition}{\csu@cap@definition}
\newtheorem{proposition}{\csu@cap@proposition}
\newtheorem{theorem}{\csu@cap@theorem}
\newtheorem{lemma}{\csu@cap@lemma}
\newtheorem{corollary}{\csu@cap@corollary}
\newtheorem{assumption}{\csu@cap@assumption}
\newtheorem{conjecture}{\csu@cap@conjecture}
\newtheorem{axiom}{\csu@cap@axiom}
\newtheorem{principle}{\csu@cap@principle}
\newtheorem{problem}{\csu@cap@problem}
\newtheorem{example}{\csu@cap@example}
\newtheorem{proof}{\csu@cap@proof}
\newtheorem{solution}{\csu@cap@solution}

% 数学定理相关的常量
\newcommand*{\csu@cap@definition}{定义}
\newcommand*{\csu@cap@proposition}{命题}
\newcommand*{\csu@cap@theorem}{定理}
\newcommand*{\csu@cap@lemma}{引理}
\newcommand*{\csu@cap@corollary}{推论}
\newcommand*{\csu@cap@assumption}{假设}
\newcommand*{\csu@cap@conjecture}{猜想}
\newcommand*{\csu@cap@axiom}{公理}
\newcommand*{\csu@cap@principle}{定律}
\newcommand*{\csu@cap@problem}{问题}
\newcommand*{\csu@cap@example}{例}
\newcommand*{\csu@cap@proof}{证明}
\newcommand*{\csu@cap@solution}{解}


% TODO 测试段落后间距
% 各级标题格式设置。
\ctexset{%
    chapter = {%
        format       = \zihao{3} \heiti\centering,
        name         = {第, 章},
        nameformat   = {},
        number       = \arabic{chapter},
        numberformat = {},
        titleformat  = {},
        aftername    = \quad,
        afterindent  = true,
        % beforeskip 默认为 50pt 适当缩减
        fixskip      = true,
        beforeskip   = {15pt},
        % beforeskip   = {\ifcsu@type@graduate 20pt \else 5pt\fi}
        % afterskip 默认为 40pt 适当缩减
        afterskip    = {40pt},
        % afterskip    = {\ifcsu@type@graduate 30pt\else 20pt\fi},
    },
    section = {%
        format       = \zihao{-4} \heiti,
        afterindent  = true,
        % beforeskip 默认为 3.5ex plus 1ex minus .2ex 适当缩减
        beforeskip   = {20pt},
        % beforeskip   = {\ifcsu@type@graduate 30pt \else 20pt\fi}
        % afterskip 默认为 2.3ex plus .2ex 适当缩减
        afterskip    = {1ex \@plus .2ex},
    },
    subsection = {%
        format       = \zihao{-4} \kaiti,
        beforeskip   = {10pt},
        % afterindent  = true,
        % afterskip 默认为 2.3ex plus .2ex 适当缩减
        afterskip    = {1ex \@plus .2ex},
        % fixskip      = true,
    },
    subsubsection = {%
        format       = \zihao{-4} \normalfont,
        beforeskip   = {10pt},
        % afterindent  = true,
        afterskip    = {1ex \@plus .2ex},
        % fixskip      = true,
    },
}
\setcounter{secnumdepth}{3}
% 定义描述距离的变量
\newlength{\csu@headings@indent@fixed}
\setlength{\csu@headings@indent@fixed}{2\ccwd}
\newcommand{\csu@style@set@indent@heading}{%
    \gdef\csu@headings@indent{\csu@headings@indent@fixed}
    % \ifsjtu@type@graduate\relax\else
    % 本科毕设设置四级标题
    \ctexset{%
        subsubsection/name   = {(,)},
        subsubsection/number = \arabic{subsubsection},
    }
    % \fi
    % 设标题的缩进
    \ctexset{%
        section/indent       = \csu@headings@indent,
        subsection/indent    = \csu@headings@indent,
        subsubsection/indent = \csu@headings@indent,
    }
}
\csu@style@set@indent@heading

% 全文首行缩进 2 字符， 标点符号用全角
% \ctexset{%
%   punct          = quanjiao,
%   space          = auto,
%   autoindent     = true,
% }

% % 编号分章节。如需要连续编号，注释\makeatletter下面对应内容即可。
% \renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
% \makeatletter
% \@addtoreset{figure}{section}
% \@addtoreset{table}{section}
% \@addtoreset{equation}{section}
% \makeatother

% 8. 参考文献 %
% ------------------------------------------------------%
% TODO %
% 文后参考文献只列出作者直接阅读过、在正文中被引用过的文献资料，务必实事求是。参考文献一律列在正文的末尾，不得放在各章之后。人文社科类学位论文中不宜用文后参考文献列出的注释可采用页下注，包括对学位论文中某些关键词句、论点的详细说明。在引用别人的科研成果时，应在引用处加以说明，遵循学术道德规范，严禁论文抄袭、剽窃等学术不端行为。
% 参考文献可以采用顺序编码制组织，也可以按“著者-出版年”制组织。建议按顺序编码制，即按中文引用的顺序将参考文献附于文末。作者姓名写到第三位，余者写“，等”或“，et al.”。“参考文献”四字居中(三号黑体)，空一行左起按顺序依次列出参考文献，将序号置于方括号内(如[1])，用小四号宋体字，所有符号均用半角编排。
% 目前采用bgt7714-2005标准进行文献索引，详见gbt7714-2005.bst.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 附录
%
% 附录中主要列入正文内不便列出的过分冗长的公式推导，供查读方便所需的辅助性数学工具或表格、重复性数据图表、计算程序及说明等。
% 附录依次为附录1，附录2……等，“附录X”三字居中（三号黑体）。附录中的图表公式另编排序号，与正文分开。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义附录环境
% 在\appendix 后直接使用 chapter
% 暂不需要
% \newenvironment{appendixs}{
%     % \ifcsu@review\else
%     \csu@chapter{\csu@name@appendix}
%     % \fi
% }


% 10. 攻读学位期间主要研究成果 %
% --------------------------------------------------------%
% 分类按时间顺序列出作者在攻读学位期间取得的与学位论文相关的研究成果，含参加的研究项目、获奖情况、专利、专著、发表学术论文（含正式录用论文）等,书写格式参照参考文献格式。“攻读学位期间主要研究成果”字体居中（三号黑体）

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 致谢
%
% 作者对给予指导、各类资助和协助完成研究工作以及提供各种对论文工作有利条件的单位及个人表示感谢。“致谢”二字居中（三号黑体）。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义致谢环境
\newenvironment{acknowledgements}{
%   \ifcsu@review\relax\else
    \ifcsu@review\else
    % Fix: 修复书签定位问题
    % \chapter*{\csu@name@acknowledgements}
    % \csu@pdfbookmark{0}{\csu@name@acknowledgements}
    % \phantomsection
    \csu@chapter{\csu@name@acknowledgements}
    % \csu@chapter{\csu@name@acknowledgements}
  \fi
}


% 篇眉和页码要求 %
% ---------------------------------------------------------%
% 篇眉从正文开始至全文结束，采用宋体五号字左起书写“博（或硕）士学位论文”，靠右写章标题。
% 页码从正文开始至全文结束按阿拉伯数字连续编排，前置部分（如学位论文原创性声明和版权使用授权书、中文摘要、英文摘要、目录、符号说明等）用罗马数字分别单独编排。页码位于页面底端，居中书写。



