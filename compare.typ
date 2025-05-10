// Document Setup
#set document(title: "LC-3 Emulator and Educational Platform: Development Proposal")

// Define a Color Palette
#let UoABlue = rgb(0, 51, 102)
#let UoABlueLight = rgb(0, 77, 153)
#let UoABlueLighter = rgb(230, 240, 255) // Very light blue for backgrounds
#let UoABluePale = rgb(235, 245, 250)   // Another pale blue option

#let UoAGray = rgb(70, 70, 70)         // Darker gray for text/strokes
#let UoAGrayMid = rgb(120, 120, 120)     // Mid gray
#let UoAGrayLight = rgb(241, 245, 249) // Light gray for table stripes, etc.
#let UoAGrayBorder = rgb(200, 200, 200)  // For subtle borders

#let AccentColor1 = rgb(0, 102, 102)     // Teal
#let AccentColor1Light = AccentColor1.lighten(85%)
#let AccentColor1Dark = AccentColor1.darken(30%)

#let AccentColor2 = rgb(102, 51, 0)     // Brownish Orange
#let AccentColor2Light = AccentColor2.lighten(85%)
#let AccentColor2Dark = AccentColor2.darken(30%)

#let AccentColor3 = rgb(102, 0, 102)     // Purple
#let AccentColor3Light = AccentColor3.lighten(85%)
#let AccentColor3Dark = AccentColor3.darken(30%)

#let SuccessGreen = rgb(223, 240, 216) // Pastel Green (background for checkmark)
#let SuccessGreenText = rgb(60, 118, 61) // Darker Green (for checkmark symbol)
#let FailureRed = rgb(242, 222, 222)   // Pastel Red (background for cross)
#let FailureRedText = rgb(169, 68, 66)   // Darker Red (for cross symbol)

#let White = white
#let Black = black


// Page Setup
#set page(
  margin: (x: 2.0cm, y: 2.0cm),
  numbering: "1",
  header: align(
    right + top,
    text(fill: UoAGrayMid, size: 9pt, "University of Auckland | LC-3 Emulator Development Proposal")
  ),
  footer: align(center, text(size: 9pt, context counter(page).display()))
)

// Text and Heading Setup
#set text(font: "Linux Libertine", size: 11pt, lang: "en", fill: UoAGray.darken(10%))

#show heading.where(level: 1): it => block(
  above: 2em,
  below: 1em,
  text(weight: "bold", size: 16pt, fill: UoABlue, it)
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.6em,
  text(weight: "semibold", size: 13pt, fill: UoABlueLight, it)
)
#set heading(numbering: "1.")


// Title Page
#align(center)[
  #block(text(weight: "bold", size: 24pt, fill: UoABlue)[
    LC-3 Emulator: A Comprehensive Educational Platform
  ])
  #v(0.7cm)
  #block(text(size: 16pt, fill: UoABlueLight)[
    Development Proposal for the University of Auckland
  ])
  #v(2cm)
  Prepared by Jack Crump-Leys
  #v(0.3cm)
  jackcrumpleys\@gmail.com
  #v(3cm)
]
#pagebreak()

= Executive Summary

This proposal presents a compelling case for the University of Auckland to continue development of our LC-3 emulator platform. The LC-3 architecture serves as a cornerstone for COMPSCI 210. Our emulator offers significant advantages over existing solutions through its textbook-accurate implementation, modern web-based interface, and comprehensive educational features.

The emulator is already operational in its current state, with a substantial foundation of features implemented. Continued development will focus on enhancing the educational value through improved visualization tools, expanded debugging capabilities, and integration with course materials.

= Background

The Little Computer 3 (LC-3) is a simplified computer architecture designed for educational purposes. It provides students with a fundamental understanding of computer organization, assembly language programming, and low-level system operations. Despite its importance in computer science education, existing LC-3 emulators often present several limitations:

- Inconsistency with textbook specifications
- Poor user interface design
- Limited platform availability
- Lack of modern debugging tools
- Inadequate educational features

These limitations create barriers to learning and often require multiple different tools to achieve comprehensive understanding.
= Competitive Analysis

// --- Data for the Competitive Analysis Table ---
#let T_sym = sym.checkmark // Use Typst's symbol for checkmark
#let F_sym = sym.crossmark// Use Typst's symbol for cross

// Emulator names for the header
#let emulators = ([Our Emulator #footnote("Features either already implemented or trivial to implement.")], "Manitoba", "LC3web", "LC3Tutor", "LC3UArch", "PennSim", "LC3Tools")

// Categorized features
#let feature_categories = (
  (
    title: "Core Functionality & Conformity",
    color: UoABlueLighter, 
    text_color: UoABlue,
    items: (
      ("Textbook conformity",      T_sym, F_sym, F_sym, F_sym, F_sym, F_sym, T_sym),
      ("Assembler",                T_sym, T_sym, T_sym, T_sym, F_sym, T_sym, T_sym),
      ("Cycle-accurate simulation",T_sym, F_sym, F_sym, F_sym, T_sym, F_sym, F_sym),
      ("Object file support",      T_sym, F_sym, F_sym, F_sym, F_sym, T_sym, T_sym),
    )
  ),
  (
    title: "Debugging & Inspection",
    color: AccentColor1Light,
    text_color: AccentColor1Dark,
    items: (
      ("Quality error messages",   T_sym, T_sym, T_sym, T_sym, F_sym, F_sym, T_sym),
      ("Breakpoints",              T_sym, T_sym, T_sym, T_sym, F_sym, T_sym, T_sym),
      ("Memory viewing",           T_sym, T_sym, T_sym, T_sym, T_sym, T_sym, T_sym),
      ("Memory decompilation",     T_sym, T_sym, F_sym, F_sym, T_sym, T_sym, T_sym),
      ("Step-by-step execution",   T_sym, T_sym, T_sym, T_sym, T_sym, T_sym, T_sym),
      ("Register and memory editing", T_sym, T_sym, T_sym, T_sym, F_sym, T_sym, T_sym),
    )
  ),
  (
    title: "Platform & User Experience",
    color: AccentColor2Light,
    text_color: AccentColor2Dark,
    items: (
      ("Web platform",             T_sym, T_sym, T_sym, T_sym, F_sym, F_sym, F_sym),
      ("Windows",                  T_sym, F_sym, F_sym, F_sym, T_sym, T_sym, T_sym),
      ("macOS",                    T_sym, F_sym, F_sym, F_sym, T_sym, T_sym, T_sym),
      ("Linux",                    T_sym, F_sym, F_sym, F_sym, T_sym, T_sym, T_sym),
      ("Syntax highlighting",      T_sym, T_sym, F_sym, F_sym, F_sym, F_sym, T_sym),
      ("Documentation",            T_sym, T_sym, T_sym, T_sym, F_sym, F_sym, T_sym),
      ("Console I/O",              T_sym, F_sym, T_sym, T_sym, F_sym, T_sym, T_sym),
      ("Dark mode",                T_sym, T_sym, F_sym, F_sym, F_sym, F_sym, T_sym),
    )
  )
)
// --- End of Data Definition ---

#figure(
  block( // This block helps to group the table for page breaking and captioning
    table(
      columns: for n in range(emulators.len()+1) { if n == 0 {(auto,)} else {(1.2fr,)}}, 
      inset: 5pt,      
      stroke: UoAGrayBorder, 
      fill: (c, r) => if r==0 {UoABlueLight},
      

      table.header(

        // align: center + horizon,
        // fill: UoABlueLight, 
        text(weight: "bold", size: 10pt, fill: White)[Feature],
        ..for name in emulators {(text(weight: "bold", size: 10pt, fill: White)[#name],)}
      ),

      ..for category_idx in range(feature_categories.len()) {
        let category = feature_categories.at(category_idx)
        let is_last_category = category_idx == feature_categories.len() - 1

        (table.cell(
          colspan: 1 + emulators.len(),
          fill: category.color,
          stroke: (y: UoAGray.darken(10%)), 
          inset: (x: 8pt, y: 5pt), 
          align(center, text(weight: "bold", size: 10.5pt, fill: category.text_color, category.title))
        ),)

        for feature_row_idx in range(category.items.len()) {
          let feature_row = category.items.at(feature_row_idx)
          let is_last_row_in_category = feature_row_idx == category.items.len() - 1
          
          let cell_bottom_stroke = if is_last_row_in_category and not is_last_category {
             (paint: UoAGray.darken(10%), thickness: 0.8pt)
          } else {
             (paint: UoAGrayBorder, thickness: 0.5pt)
          }

          (table.cell(
            align: left + horizon,
            inset: (left: 10pt, right: 6pt, y: 5pt),
            stroke: (bottom: cell_bottom_stroke),
            feature_row.at(0) 
          ),)

          for i in range(1, feature_row.len()) {
            let value = feature_row.at(i)
            let cell_fill_color = if value == T_sym { SuccessGreen }
                                 else if value == F_sym { FailureRed }
                                 else { White } 
            let symbol_color = if value == T_sym { SuccessGreenText }
                              else if value == F_sym { FailureRedText }
                              else { Black }

            (table.cell(
              fill: cell_fill_color,
              inset: 0pt, 
              align(center, text(size: 1.2em, fill: symbol_color, value)), 
              stroke: (bottom: cell_bottom_stroke)
            ),)
          }
        }
      }
    )
  ),
  caption: [Comparative analysis of LC-3 emulators],
)
= Assessment of Alternatives

// Highlight function for emulator names
#let highlight(emulator_name) = text(fill: AccentColor2.darken(20%), weight: "semibold")[#emulator_name]

- #highlight("Manitoba LC-3"): While offering an excellent web interface, it lacks cross-platform desktop support and has inconsistencies with the textbook implementation. Additionally, it doesn't support custom object files.

- #highlight("LC3web") and #highlight("LC3Tutor"): These platforms provide basic web functionality but lack critical features such as memory decompilation, syntax highlighting, and dark mode. They also contain implementation deviations from the textbook standards.

- #highlight("LC3UArch"): Primarily focuses on datapath visualization rather than providing a complete educational environment. It lacks many essential features like breakpoints, a run button, and console I/O. The datapath  visualization feature is super useful and would be a great addition to our tool.

- #highlight("PennSim"): An outdated option with a clunky user interface that has fallen behind modern educational needs. It doesn't conform to the current textbook standard used at UoA. This is the current tool that the course uses.

- #highlight("LC3Tools"): While being the most comprehensive alternative and offering textbook conformity, it suffers from buggy input handling and lacks web platform support, limiting accessibility for students.

// Reusable styled block component for informational sections
#let info_block(title_text, title_color, border_color, fill_color, body_content) = {
  block(
    fill: fill_color,
    radius: 5pt,
    stroke: (paint: border_color, thickness: 1pt),
    inset: 15pt,
    width: 100%,
    spacing: 0.7em, 
    // margin: (bottom: 1em),
    [
      #text(fill: title_color, size: 14pt, weight: "bold")[#title_text]
      #body_content
    ]
  )
}

= Our Solution

Our LC-3 emulator represents a unique combination of technical accuracy, educational utility, and modern design principles:

== Technical Implementation

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  info_block(
    "Core Architecture",
    UoABlue,
    UoABlueLight.darken(10%),
    UoABlueLighter,
    [
      - Complete implementation of all LC-3 instructions
      - Cycle-accurate simulation with visible micro-operations
      - Privilege level support (User/Supervisor mode)
      - Memory protection and exception handling
      - Full conformity with the 3rd edition of "Introduction to Computer Systems" by Yale N. Patt and Sanjay J. Patel
    ]
  ),
  info_block(
    "Modern Development Stack",
    AccentColor1Dark,
    AccentColor1,
    AccentColor1Light,
    [
      - Built with Rust for reliability and performance
      - WASM compilation for cross-platform web support
      - Native binaries for all major desktop platforms
      - Modular design for easy extensibility
    ]
  )
)

== Educational Features

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  info_block(
    "Debugging Capabilities",
    AccentColor2Dark,
    AccentColor2,
    AccentColor2Light,
    [
      - Step-by-step execution at instruction or micro-operation level
      - Integrated breakpoint system
      - CPU state info for understanding processor cycles
      - Detailed parsing errors for assembly programs
    ]
  ),
  info_block(
    "User Experience",
    AccentColor3Dark, // Using the purple theme here
    AccentColor3,
    AccentColor3Light,
    [
      - Provide the power of a desktop application on a web platform
      - Modern, intuitive interface to provide an IDE
      - Flexible pane system for customized workspace layouts
      - Integrated help system with examples and documentation
      - Syntax highlighting for assembly code
      - Consistent experience across web and desktop platforms
    ]
  )
)

= Development Roadmap

The following are key areas for continued development:

// Consolidated block for roadmap items
#let roadmap_item_block(title, items, main_color) = info_block(
    title,
    main_color.darken(40%),
    main_color.darken(20%),
    main_color.lighten(88%),
    items
)

== Educational Enhancements
#stack(spacing: 0em,roadmap_item_block(
    "Memory visualization improvements",
    [
      - Memory region highlighting (stack, heap, code, data)
      - Memory access history tracking
      - Value change indicators
    ],
    rgb(0,128,0) // Green
  ), // info_block already has bottom margin 
roadmap_item_block(
    "Advanced debugging tools",
    [
      - Conditional breakpoints
      - Memory watchpoints
      - Execution path recording and playback
    ],
    rgb(0,0,139) // Dark Blue
  )
,roadmap_item_block(
    "Interactive learning features",
    [
      - Guided tutorials on assembly concepts
      - Challenge exercises with automatic verification
      - Interactive datapath visualization
    ],
    rgb(128,0,128) // Purple
  )
  )

= Benefits to the University of Auckland

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  info_block(
    "Enhanced Learning Outcomes",
    rgb(0,100,0).darken(10%), // Dark Green
    rgb(0,100,0),
    rgb(0,100,0).lighten(90%),
    [
      - Improved student comprehension of computer architecture concepts
      - Reduced learning curve through integrated tooling
      - Consistent experience aligned with textbook material
      - Accessible anywhere through web platform
      - Reduced technical support requirements
    ]
  ),
  info_block(
    "Administrative Advantages",
    UoABlue,
    UoABlueLight.darken(10%),
    UoABlueLighter,
    [
      - Single platform for all course requirements
      - Reduced need for multiple software tools
      - Cross-platform support for all student devices
    ]
  )
)

== Long-term Value

#info_block(
  "Future-Proof Investment",
  AccentColor2Dark, 
  AccentColor2, 
  AccentColor2Light,
  [
    - Modular architecture allows easy updates as curriculum evolves
    - Framework extensible to other educational architectures
    - Demonstrates university's commitment to quality educational tools
    - Enhances appeal of the computer science program to prospective students
    - Potential for future COMPSCI tooling based on this foundation
  ]
)
= Conclusion

Our LC-3 emulator represents a significant advancement over existing solutions, offering a comprehensive, textbook-accurate implementation with modern features and cross-platform support. By funding its continued development, the University of Auckland can provide students with a superior educational tool that enhances learning outcomes while reducing technical barriers.

The platform unifies the best features from all existing alternatives while adding innovative capabilities that directly support the educational goals of COMPSCI 210. This investment will yield returns through improved student learning outcomes, reduced technical support needs, and enhanced reputation for the Computer Science department.


