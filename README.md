# Uganda Chatbot CRCT

This repository contains the cleaning and analysis code for the Uganda Chatbot Cluster Randomized Controlled Trial (CRCT) research project.

## Project Overview

This project processes and analyzes data from a cluster randomized controlled trial evaluating a chatbot intervention in Uganda. The codebase is organized to follow a clear data processing pipeline from raw data import through final analysis.

## Repository Structure

The repository is organized into several main directories, each serving a specific purpose in the data processing workflow:

```
UgandaChatbotCRCT/
├── Master.do              # Main execution file - runs the entire pipeline
├── globals.do             # Global paths
├── ado/                   # Custom Stata ado-files (user-written commands)
├── import/                # Data import scripts
│   └── baseline_knowledge/
│       └── import_knowledge_test.do
├── cleaning/              # Data cleaning scripts
│   ├── backenddata/      # Backend data cleaning
│   ├── SPdata/           # Standardized patient data cleaning
│   └── surveydata/       # Survey data cleaning
├── datachecks/           # Data quality checks
│   ├── backenddata/
│   ├── SPdata/
│   └── surveydata/
│       └── highfrequencycheckpipeline.do
├── tidying/              # Data tidying and preparation
│   ├── Datasetconstruction/
│   ├── Deduplication/   # Remove duplicate records
│   │   ├── backenddata/
│   │   ├── SPdata/
│   │   └── surveydata/
│   └── Deidentification/ # Remove identifying information
│       ├── backenddata/
│       ├── SPdata/
│       └── surveydata/
├── randomization/        # Randomization scripts
│   └── randomize.do
└── analysis/             # Final analysis and outputs
    ├── figures/          # Generated figures
    ├── tables/           # Generated tables
    └── manuscript/       # Manuscript LaTeX files
        └── Main.tex
```

### Directory Descriptions

- **`Master.do`**: The main script that orchestrates the entire data processing pipeline. Run this file to execute all steps in sequence.

- **`globals.do`**: Defines global macros (variables) used throughout the project. Contains relative paths that are automatically derived from the main globals set in `Master.do`. Only needs modification if the repository structure changes.

- **`ado/`**: Contains custom Stata ado-files (user-written commands). These are Stata programs that can be called from any script in the project.

- **`import/`**: Scripts for importing raw data from various sources (e.g., SurveyCTO exports, Excel files). Each data source has its own subdirectory.

- **`cleaning/`**: Scripts that clean and standardize raw data. Organized by data type:
  - `backenddata/`: Backend/system data
  - `SPdata/`: Standardized patient data
  - `surveydata/`: Survey response data

- **`datachecks/`**: Quality assurance scripts that check data integrity, identify outliers, and flag potential issues. Includes high-frequency check pipelines for ongoing data monitoring.

- **`tidying/`**: Scripts that prepare data for analysis:
  - `Datasetconstruction/`: Combines cleaned datasets into analysis-ready formats
  - `Deduplication/`: Removes duplicate records
  - `Deidentification/`: Removes or masks personally identifiable information

- **`randomization/`**: Scripts for generating and managing randomization assignments for the trial.

- **`analysis/`**: Final analysis scripts and outputs:
  - `figures/`: Generated graphs and visualizations
  - `tables/`: Generated summary and results tables
  - `manuscript/`: LaTeX source files for the research manuscript

## Getting Started

### Prerequisites

- **Stata**: This project requires Stata (version 14 or later recommended)
- **GitHub Desktop**: For version control (see Contributing section)
- **Data Access**: Access to the project Dropbox folder containing raw data

### Initial Setup

1. **Clone the repository** (see Contributing section for instructions using GitHub Desktop)

2. **Configure your user-specific paths in `Master.do`**:
   - Open `Master.do` in Stata
   - Find the section labeled "1) set user network path"
   - Add your username and corresponding paths following the existing pattern:
     ```stata
     if "`user'"== "your_username" {
         global dropbox="path/to/your/dropbox"
         global code="path/to/this/repository"
     }
     ```
   - You only need to set these two globals: `dropbox` (path to your Dropbox folder) and `code` (path to this repository)

3. **Note about `globals.do`**:
   - The `globals.do` file contains relative paths that are automatically derived from the two main globals you set in `Master.do`
   - You do **not** need to modify `globals.do` unless the repository structure changes
   - All other paths (like `global data`, `global raw`, etc.) are calculated relative to your `dropbox` and `code` paths

4. **Verify data locations**:
   - Ensure your Dropbox folder structure matches what's expected (the code assumes data is in `${dropbox}/4_Data`)

### Running the Pipeline

To run the entire data processing pipeline:

1. Open Stata
2. Navigate to the repository directory:
   ```stata
   cd "/path/to/UgandaChatbotCRCT"
   ```
3. Run the master script:
   ```stata
   do Master.do
   ```

The master script will execute all steps in sequence. You can also run individual scripts from each directory as needed.

## Contributing

This section explains how to contribute to the project using GitHub Desktop. If you're new to version control, don't worry—GitHub Desktop makes it simple!

### What is Version Control?

Version control (Git) is like a time machine for your code. It:
- Saves snapshots of your work so you can go back to previous versions
- Lets multiple people work on the same files without overwriting each other
- Tracks who made what changes and when
- Makes it easy to share your work with the team

### Getting Started with GitHub Desktop

1. **Install GitHub Desktop**:
   - Download from [desktop.github.com](https://desktop.github.com/)
   - Install and sign in with your GitHub account

2. **Clone the repository** (first time only):
   - Open GitHub Desktop
   - Click "File" → "Clone Repository"
   - Find "UgandaChatbotCRCT" in the list, or paste the repository URL
   - Choose where on your computer you want to save it
   - Click "Clone"

3. **Open the repository**:
   - The repository will appear in GitHub Desktop
   - Click "Open in Finder" (Mac) or "Show in Explorer" (Windows) to see the files

### Making Changes

1. **Before you start working**:
   - Open GitHub Desktop
   - Make sure you're on the `main` branch (see the branch dropdown at the top)
   - Click "Fetch origin" to get the latest changes from the team
   - If there are updates, click "Pull origin" to download them to your computer

2. **Make your changes**:
   - Edit files in Stata or your text editor as usual
   - Save your files normally

3. **Review your changes**:
   - Go back to GitHub Desktop
   - You'll see a list of files you've changed on the left
   - Click on each file to see what you changed (additions in green, deletions in red)

4. **Commit your changes**:
   - At the bottom, write a brief message describing what you did (e.g., "Fixed typo in import script" or "Added new cleaning step for survey data")
   - Click "Commit to main" (or create a new branch first—see below)

5. **Share your changes**:
   - Click "Push origin" to upload your changes to GitHub
   - Your teammates will now be able to see your work!

### Working with Branches (Recommended)

Branches let you work on features without affecting the main code. Think of it like making a copy to experiment with.

1. **Create a new branch**:
   - In GitHub Desktop, click the branch dropdown at the top
   - Type a name for your branch (e.g., "add-new-cleaning-step")
   - Press Enter

2. **Work on your branch**:
   - Make your changes as usual
   - Commit and push to your branch (it will say "Push origin" with your branch name)

3. **Create a Pull Request** (to merge your changes into main):
   - After pushing, GitHub Desktop will show a button: "Create Pull Request"
   - Click it, add a description of what you changed, and click "Create Pull Request"
   - Your teammates can review your changes before they're merged into the main code

4. **Switch between branches**:
   - Use the branch dropdown to switch back to `main` or to other branches
   - GitHub Desktop will update your files automatically

### Best Practices

1. **Commit often**: Make small, logical commits rather than one big commit at the end of the day. Each commit should represent one complete thought or change.

2. **Write clear commit messages**: 
   - Good: "Add deduplication step for survey data"
   - Bad: "changes" or "fix stuff"

3. **Pull before you push**: Always fetch and pull the latest changes before starting work or before pushing your changes. This prevents conflicts.

4. **Don't commit data files**: Only commit code (`.do` files, `.tex` files, etc.). Data files should stay in Dropbox, not in the repository.

5. **Test your code**: Before committing, make sure your code runs without errors (or at least document known issues in your commit message).

6. **Communicate**: If you're working on something that might affect others, let the team know!

### Resolving Conflicts

Sometimes, two people edit the same part of a file. When you try to pull, GitHub Desktop will tell you there's a conflict.

1. **GitHub Desktop will highlight the conflict**
2. **Open the file** and look for conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
3. **Choose which version to keep** (or combine both if needed)
4. **Remove the conflict markers**
5. **Save the file**
6. **In GitHub Desktop, mark the conflict as resolved** and commit

If you're unsure, ask a teammate for help!

### Getting Help

- **GitHub Desktop Help**: Click "Help" → "Documentation" in GitHub Desktop
- **Ask the team**: Don't hesitate to ask if you're stuck
- **GitHub Guides**: [guides.github.com](https://guides.github.com/) has beginner-friendly tutorials

## File Naming Conventions

- Use lowercase with underscores: `import_knowledge_test.do` (not `ImportKnowledgeTest.do`)
- Be descriptive: `clean_survey_data.do` is better than `clean.do`
- Include version numbers if needed: `analysis_v2.do`

## Code Style Guidelines

- **Comments**: Add comments explaining what your code does, especially for complex logic
- **Indentation**: Use consistent indentation (tabs or spaces, but be consistent)
- **Variable names**: Use clear, descriptive names
- **Section headers**: Use comment blocks to separate sections:
  ```stata
  *****************************************
  * Section Name
  *****************************************
  ```

## Data Privacy and Security

- **Never commit sensitive data**: This includes personally identifiable information (PII), raw data files, or any files containing participant information
- **Use deidentification scripts**: Always run deidentification scripts before sharing any data outputs
- **Data location**: Keep all raw data in the shared Dropbox folder, not in this repository

## Questions?

If you have questions about:
- **The code**: Check the comments in the relevant script or ask the team
- **The data**: Refer to the data documentation or contact the data manager
- **Git/GitHub Desktop**: See the Contributing section above or ask for help


